FROM golang:1.16-alpine AS base
WORKDIR /app

ENV GO111MODULE="on"
ENV GOOS="linux"
ENV CGO_ENABLED=0

# System dependencies
RUN apk update \
    && apk add --no-cache \
    ca-certificates \
    git \
    && update-ca-certificates

### Development with hot reload and debugger
FROM base AS dev
WORKDIR /app

# Hot reloading mod
RUN go get -u github.com/cosmtrek/air && go install github.com/go-delve/delve/cmd/dlv@latest
EXPOSE 8080
EXPOSE 2345

ENTRYPOINT ["air"]

### Executable builder
FROM base AS builder
WORKDIR /app

# Application dependencies
COPY . /app
RUN go mod download \
    && go mod verify

RUN go build -o k8s-workshop -a .

### Production
FROM alpine:latest AS prod

ARG APP_VERSION
ENV APP_VERSION="${APP_VERSION}"

RUN apk update \
    && apk add --no-cache \
    ca-certificates \
    curl \
    iputils \
    tzdata \
    && update-ca-certificates

# Copy executable
COPY --from=builder /app/k8s-workshop /usr/local/bin/k8s-workshop
EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/k8s-workshop"]
