FROM golang:1.10 as builder
COPY /src/sum .
RUN GOOS=linux go build -ldflags="-s -w" sum.go
RUN ls

FROM hello-world:latest
COPY --from=builder /go/sum .
COPY /src/sum/sum_test.go .

ENTRYPOINT [ "/sum"]

# FROM hello-world

# COPY /src/sum/sum .

# ENTRYPOINT [ "/sum"]