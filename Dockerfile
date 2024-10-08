# Multi-arch build (local):
#     docker buildx create --use --driver=docker-container --name container --bootstrap
#     docker buildx build . --platform=linux/arm/v7 --builder=container --progress plain -o dist -f Dockerfile

# map source image to base
FROM python:3.12-alpine3.19 AS base
WORKDIR /app
RUN \
  apk update && \
  apk add git curl binutils gcc libc-dev libffi-dev zlib-dev openssl-dev tzdata bash python3-dev musl-dev pkgconfig cargo
# from https://cryptography.io/en/latest/installation/#building-cryptography-on-linux
# If you get an error with openssl-dev you may have to use libressl-dev.
# cargo 

FROM base AS builder
WORKDIR /app
RUN \
    python3 -m venv .venv && \
    . .venv/bin/activate && \
    pip3 install --disable-pip-version-check cryptography

FROM scratch
WORKDIR /
COPY --from=builder /app/* .
