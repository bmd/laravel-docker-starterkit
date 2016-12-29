#!/bin/bash

: ${COMPOSER_CACHE_DIR:=~/.composer/cache}
docker run -it --rm \
    -v `pwd`:/app \
    -v ~/.ssh:/root/.ssh \
    -v "$COMPOSER_CACHE_DIR":/root/.composer \
    -w /app \
    authentication/utility:v1 composer "$@"
