package usecase

import (
	"time"
	"context"
	"encoding/json"
	"github.com/go-playground/validator/v10"
	"github.com/gofiber/fiber/v2"
	"github.com/redis/go-redis/v9"
	"github.com/sirupsen/logrus"
	"golang-clean-architecture/internal/model"
	"golang-clean-architecture/internal/model/converter"
	"golang-clean-architecture/internal/repository"
	"gorm.io/gorm"
)

type CategoryUseCase struct {
	DB                 *gorm.DB
	Log                *logrus.Logger
	Validate           *validator.Validate
	CategoryRepository *repository.CategoryRepository
	Redis 			   *redis.Client
}

func NewCategoryUseCase(db *gorm.DB, logger *logrus.Logger, validate *validator.Validate,
	CategoryRepository *repository.CategoryRepository, redis *redis.Client) *CategoryUseCase {
	return &CategoryUseCase{
		DB:                 db,
		Log:                logger,
		Validate:           validate,
		CategoryRepository: CategoryRepository,
		Redis:				redis,
	}
}

func (c *CategoryUseCase) List(ctx context.Context) (string, error) {
	// check redis
	var responses []model.CategoryResponse
	value, err := c.Redis.Get(ctx, "categories").Result()
	if err == nil {
		return value, nil
	}

	tx := c.DB.WithContext(ctx).Begin()
	defer tx.Rollback()

	// if not found in redis, query to database
	// load parent categories
	parents, err := c.CategoryRepository.FindAllParents(tx)
	if err != nil {
		c.Log.WithError(err).Error("failed to load parent categories")
		return "", fiber.ErrInternalServerError
	}

	// iterate each parent
	for _, parent := range parents {
		response := converter.CategoryToResponse(&parent)

		var childResponses []model.CategoryResponse
		for _, child := range parent.Children {
			responseChild := converter.CategoryToResponse(&child)
			childResponses = append(childResponses, responseChild)
		}
		response.Children = childResponses

		responses = append(responses, response)
	}

	// save to redis
	jsonValue, err := json.Marshal(fiber.Map{
		"data": responses,
	})
	if err != nil {
		c.Log.WithError(err).Error("failed to marshal json")
		return "", fiber.ErrInternalServerError
	}

	err = c.Redis.Set(ctx, "categories", jsonValue, time.Hour*1).Err()
	if err != nil {
		c.Log.WithError(err).Error("failed to save to redis")
		return "", fiber.ErrInternalServerError
	}

	return string(jsonValue), nil
}
