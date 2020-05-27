FROM golang:1.10 as builder
COPY /src/sum .
RUN GOOS=linux go build -ldflags="-s -w" sum.go
RUN ls

FROM hello-world:latest
COPY --from=builder /go/sum .
COPY --from=builder /go/sum_test .

ENTRYPOINT [ "/sum"]

# FROM hello-world

# COPY /src/sum/sum .

# ENTRYPOINT [ "/sum"]