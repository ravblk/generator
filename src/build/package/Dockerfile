FROM golang:1.15-alpine AS builder

ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64
ENV GO111MODULE=on

RUN mkdir -p /go/src/<rep>/<app-name>
ADD . /go/src/<rep>/<app-name>

WORKDIR /go/src/<rep>/<app-name>/

RUN go build -v -o /bin/<app-name> /go/src/<rep>/<app-name>/cmd/<app-name>/main.go


FROM alpine:3.10

RUN apk --no-cache add ca-certificates

WORKDIR /bin
COPY --from=builder /bin/<app-name>  /bin/<app-name>

ENTRYPOINT ["/bin/<app-name>"]
