lint:
	golangci-lint run -v

test:
	go clean -testcache && go test -race -cover -coverprofile coverage.out ./...
	
<app-name>:
	go run cmd/<app-name>/main.go 
