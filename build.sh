#!/bin/bash

echo "Building for Linux..."
GOOS=linux GOARCH=amd64 go build -o labhub-proxy-linux ./cmd/app/main.go

echo "Building for Windows..."
GOOS=windows GOARCH=amd64 go build -o labhub-proxy.exe ./cmd/app/main.go

echo "Build finished!"
