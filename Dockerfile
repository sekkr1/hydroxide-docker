FROM golang:alpine AS builder
RUN apk add git && \
    git clone https://github.com/emersion/hydroxide.git && \
    cd hydroxide && \
    GO111MODULE=on go build ./cmd/hydroxide

FROM alpine
COPY --from=builder /go/hydroxide/hydroxide /usr/local/bin/
RUN mkdir ~/.config && \
    ln -s /config ~/.config/hydroxide
ENTRYPOINT ["hydroxide"]
