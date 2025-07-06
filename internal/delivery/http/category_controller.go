package http

import (
	"github.com/gofiber/fiber/v2"
	"github.com/sirupsen/logrus"
	"golang-clean-architecture/internal/usecase"
)

type CategoryController struct {
	UseCase *usecase.CategoryUseCase
	Log     *logrus.Logger
}

func NewCategoryController(useCase *usecase.CategoryUseCase, log *logrus.Logger) *CategoryController {
	return &CategoryController{
		Log:     log,
		UseCase: useCase,
	}
}

func (c *CategoryController) List(ctx *fiber.Ctx) error {
	responses, err := c.UseCase.List(ctx.UserContext())
	if err != nil {
		c.Log.WithError(err).Error("failed to list categories")
		return err
	}

	ctx.Set("Content-Type", "application/json")
	return ctx.Send([]byte(responses))
}
