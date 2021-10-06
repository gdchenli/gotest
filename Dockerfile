FROM registry.cn-hangzhou.aliyuncs.com/aliyun-resoure/golang:1.14.4-alpine3.12 AS builder

WORKDIR /app
ADD . .
RUN go build -o gotest main.go

FROM registry.cn-hangzhou.aliyuncs.com/aliyun-resoure/golang_alpine:latest

WORKDIR /app/bin
COPY --from=builder /app/gotest /app/bin/gotest

ENTRYPOINT ["/app/bin/gotest"]