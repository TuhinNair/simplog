FROM golang:1.16-alpine AS build
WORKDIR /go/src/simplog
COPY . .
RUN CGO_ENABLED=0 go build -o /go/bin/simplog ./cmd/simplog

FROM scratch
COPY --from=build /go/bin/simplog /bin/simplog
ENTRYPOINT [ "/bin/simplog" ]