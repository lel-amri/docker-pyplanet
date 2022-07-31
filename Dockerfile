FROM docker.io/python:3.8-alpine3.16

LABEL org.opencontainers.image.title="PyPlanet" \
      org.opencontainers.image.authors="Léo El Amri <leo@superlel.me>"

ARG PYPLANET_VERSION=0.10.0

RUN set -eux \
    ; apk add --no-cache --virtual .build-deps \
        gcc \
        musl-dev \
        g++ \
        libffi-dev \
    ; python3 -m venv /opt/pyplanet \
    ; /opt/pyplanet/bin/pip install "https://github.com/lel-amri/PyPlanet/archive/refs/heads/custom-release/0.10.x.tar.gz" \
    ; apk del --no-network .build-deps

CMD ["/opt/pyplanet/bin/pyplanet", "start"]
