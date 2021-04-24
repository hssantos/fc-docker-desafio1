FROM golang:1.14 AS builder

WORKDIR /go/src/app
COPY main.go .

RUN go build -ldflags "-s -w" main.go

FROM scratch

COPY --from=builder /go/src/app/main .

CMD ["./main"]
