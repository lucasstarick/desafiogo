FROM golang:1.10 as builder
COPY /src/sum .
RUN GOOS=linux go build -ldflags="-s -w" sum.go
# RUN ls

FROM hello-world:latest
RUN ls
COPY --from=builder /go/sum .
COPY --from=builder sum_test .

ENTRYPOINT [ "/sum"]

# FROM hello-world

# COPY /src/sum/sum .

# ENTRYPOINT [ "/sum"]