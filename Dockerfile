FROM golang:1.17.0-alpine3.14 as builder

WORKDIR /go/src/desafio-go-codeeducation

COPY . .

RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o /desafio-go-codeeducation

EXPOSE 8000

FROM scratch

COPY --from=builder /desafio-go-codeeducation /desafio-go-codeeducation

CMD ["/desafio-go-codeeducation"]