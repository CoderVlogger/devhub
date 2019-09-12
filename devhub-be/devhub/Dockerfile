FROM golang:latest
RUN mkdir /app
ADD . /app/
WORKDIR /app
RUN go test -v ./...
RUN go build -o devhub cmd/main.go
RUN ["/app/devhub"]
