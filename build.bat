@echo off
echo Building for Linux...
set GOOS=linux
set GOARCH=amd64
go build -o labhub-proxy-linux.exe ./cmd/main.go

echo Building for Windows...
set GOOS=windows
set GOARCH=amd64
go build -o labhub-proxy.exe ./cmd/main.go

echo Build finished!
pause
