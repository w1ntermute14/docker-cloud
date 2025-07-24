# Этап 1: сборка
FROM golang:latest AS builder

WORKDIR /app

# Копируем go.mod и go.sum и скачиваем зависимости
COPY go.mod go.sum ./
RUN go mod download

# Копируем исходники
COPY . .

# Сборка бинарника для linux (по умолчанию)
RUN GOOS=linux GOARCH=amd64 go build -o labhub-proxy ./cmd/app/main.go

# Этап 2: минимальный образ для запуска
FROM alpine:latest

WORKDIR /app

# Копируем бинарник из билд-образа
COPY --from=builder /app/labhub-proxy .

# Копируем конфиг (если нужен)
COPY config.yml .

# Запускаем приложение
CMD ["./labhub-proxy"]
