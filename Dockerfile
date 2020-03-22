FROM golang:1.13 AS build-env

COPY . .
RUN go get all
RUN go build .

FROM alpine:3.5 AS runtime-env

COPY --from=build-env /go/bin/app /usr/local/bin/app
