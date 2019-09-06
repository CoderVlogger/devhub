GOCMD=go
GOBUILD=$(GOCMD) build
GOTEST=$(GOCMD) test

BINARY_MAIN_NAME=devhub

SOURCE_MAIN_NAME=cmd/main.go

.PHONY: build
build:
	$(GOBUILD) -o ${BINARY_MAIN_NAME} -v ${SOURCE_MAIN_NAME}

.PHONY: test
test:
	$(GOTEST) -v ./...

.PHONY: test/e2e
test/e2e:
	docker build -f Dockerfile . -t devhub-be:e2e
