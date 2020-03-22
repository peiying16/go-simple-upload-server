FROM golang:1.13 AS build-env

RUN mkdir /app
WORKDIR /app
COPY . .
RUN go build .
RUN ls

FROM alpine:3.5 AS runtime-env
RUN mkdir /app
WORKDIR /app
RUN mkdir /app/tmp
COPY --from=build-env /app/go-simple-upload-server /app/main
RUN chmod u+x main
CMD ["./main"]
