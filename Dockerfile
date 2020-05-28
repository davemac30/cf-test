FROM golang:alpine AS builder
COPY src /go/src
RUN go install github.com/davemac30/cf-test

FROM alpine:latest
COPY --from=builder /go/bin/cf-test /usr/local/bin
CMD cf-test

