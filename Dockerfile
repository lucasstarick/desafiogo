FROM golang:1.10 as builder
COPY /src/sum .
RUN GOOS=linux go build -ldflags="-s -w" sum.go
RUN ls

FROM hello-world:latest
COPY --from=builder /go/sum .
# COPY /src/sum .

ENTRYPOINT [ "/sum"]

# FROM hello-world

# COPY /src/sum/sum .

# ENTRYPOINT [ "/sum"]

##Referências
#https://medium.com/digio-australia/building-a-robust-ci-pipeline-for-golang-with-google-cloud-build-4b5029617bc9

##https://medium.com/@sheimyrahman/golang-go-e-tdd-para-iniciantes-2418b6eadd92