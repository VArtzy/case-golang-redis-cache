## **Key Milestones Comparison**

| Metric                | Initial | N+1 Fix | +Redis | +Prefork | +Serialization w/o Prefork | Total Improvement |
|-----------------------|---------|---------|--------|----------|-----------------|-------------------|
| **Throughput**        | 104     | 310     | 749    | 777      | **2,201**       | **21.2x ↑**       |
| **p95 Latency**       | 1,070ms | 473ms   | 189ms  | 195ms    | **57ms**        | **94.7% ↓**       |
| **Avg Latency**       | 615ms   | 205ms   | 84ms   | 81ms     | **28.6ms**      | **95.3% ↓**       |
| **Max Latency**       | 1.49s   | 1.04s   | 475ms  | 654ms    | **207ms**       | **86.1% ↓**       |
| **Requests/sec**      | 104     | 310     | 749    | 777      | **2,201**       | **21.2x ↑**       |
| **Data Throughput**   | 736kB/s | 2.2MB/s | 5.3MB/s| 5.5MB/s  | **16MB/s**      | **21.7x ↑**       |

| Optimization Stage               | Throughput (req/s) | p95 Latency | Avg Latency | Max Latency | Data Throughput | vs Initial Improvement |
|----------------------------------|--------------------|-------------|-------------|-------------|-----------------|------------------------|
| **1. Initial (N+1 Issues)**      | 104                | 1,070ms     | 615ms       | 1.49s       | 736kB/s         | Baseline               |
| **2. N+1 Fix**                   | 310 (+198%)        | 473ms       | 205ms       | 1.04s       | 2.2MB/s         | 2.98x faster           |
| **3. Redis Implementation**      | 749 (+142%)        | 189ms       | 84ms        | 475ms       | 5.3MB/s         | 7.2x faster            |
| **4. Prefork Only**              | 777 (+4%)          | 195ms       | 81ms        | 654ms       | 5.5MB/s         | 7.47x faster           |
| **5. Serialization Only**        | 2,201 (+183%)      | 57ms        | 28.6ms      | 207ms       | 16MB/s          | 21.2x faster           |
| **6. Serialization+Prefork**     | 2,027          | 59.93ms | 31.06ms | 194ms   | 14MB/s      | 19.5x faster       |

### **Key Observations**:

```
Performance Milestone:
[1.07s→473ms→189ms→195ms→57ms] latency
[104→310→749→777→2201] req/s
```

```text
Timeline of p95 Latency:
1.07s → 473ms → 189ms (Now compliant)
```

---

## **Phase-by-Phase Analysis**

### **1. Initial State (N+1 Problem)**
- **p95 Latency:** 1.07s (5.4x over threshold)  
- **Bottleneck:** Redundant database queries  
- **Key Symptom:** High latency at low concurrency (104 req/s)  

### **2. After N+1 Fix**
- **p95 Latency:** 473ms (2.4x over threshold)  
- **Improvement:** 56% latency reduction, 3x throughput  
- **Remaining Issue:** Still database-bound  

### **3. After Redis Implementation**
- **p95 Latency:** 189.59ms (✓ meets <200ms SLA)  
- **Breakthrough:**  
  - 7.2x total throughput increase  
  - Sub-200ms response at 750 req/s  
  - 100% success rate maintained  

### **4. Serialization**
1. **Serialization Dominates**  
   - Accounts for **~85% of total gains** (57ms vs 195ms p95)

### **5. Prefork**
2. **Prefork Tradeoffs**  
   - Without serialization: +4% throughput (749→777 req/s)  
   - With serialization: -8% throughput (2201→2027 req/s) but better stability

## Golang Clean Architecture Template

## Description

This is golang clean architecture template.

## Architecture

![Clean Architecture](architecture.png)

1. External system perform request (HTTP, gRPC, Messaging, etc)
2. The Delivery creates various Model from request data
3. The Delivery calls Use Case, and execute it using Model data
4. The Use Case create Entity data for the business logic
5. The Use Case calls Repository, and execute it using Entity data
6. The Repository use Entity data to perform database operation
7. The Repository perform database operation to the database
8. The Use Case create various Model for Gateway or from Entity data
9. The Use Case calls Gateway, and execute it using Model data
10. The Gateway using Model data to construct request to external system 
11. The Gateway perform request to external system (HTTP, gRPC, Messaging, etc)

## Tech Stack

- Golang : https://github.com/golang/go
- MySQL (Database) : https://github.com/mysql/mysql-server
- Apache Kafka : https://github.com/apache/kafka

## Framework & Library

- GoFiber (HTTP Framework) : https://github.com/gofiber/fiber
- GORM (ORM) : https://github.com/go-gorm/gorm
- Viper (Configuration) : https://github.com/spf13/viper
- Golang Migrate (Database Migration) : https://github.com/golang-migrate/migrate
- Go Playground Validator (Validation) : https://github.com/go-playground/validator
- Logrus (Logger) : https://github.com/sirupsen/logrus
- Confluent Kafka Golang : https://github.com/confluentinc/confluent-kafka-go

## Configuration

All configuration is in `config.json` file.

## API Spec

All API Spec is in `api` folder.

## Database Migration

All database migration is in `db/migrations` folder.

### Create Migration

```shell
migrate create -ext sql -dir db/migrations create_table_xxx
```

### Run Migration

```shell
migrate -database "mysql://root:@tcp(localhost:3306)/golang_redis_cache?charset=utf8mb4&parseTime=True&loc=Local" -path db/migrations up
```

## Run Application

### Run unit test

```bash
go test -v ./test/
```

### Run web server

```bash
go run cmd/web/main.go
```

### Run worker

```bash
go run cmd/worker/main.go
```
