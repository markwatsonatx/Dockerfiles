FROM alpine:latest

RUN apk update && \
    apk add python3-dev && \
    apk add build-base && \
    python3 -m ensurepip && \
    pip3 install --upgrade pip && \
    pip3 install Flask
