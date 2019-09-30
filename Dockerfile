# -*- docker-image-name: "yat1ma30/protoc-go" -*-

FROM znly/protoc:latest
RUN apk update
RUN apk add --no-cache git openssh openssl

# install go
RUN apk add --no-cache --virtual .deps-build-go bash gcc musl-dev go ca-certificates
RUN wget -O go.tgz https://dl.google.com/go/go1.13.1.src.tar.gz
RUN tar -C /usr/local -xzf go.tgz 
RUN cd /usr/local/go/src/ && ./make.bash
ENV PATH "/usr/local/go/bin:$PATH"
ENV GOPATH "/opt/go/"
ENV PATH "$GOPATH/bin:$PATH"
RUN apk del .deps-build-go
RUN go version

# install gen-doc
RUN go get -u github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc

