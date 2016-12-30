#!/bin/bash

if [ -f .env ]; then
    source .env
fi

: ${COMPOSER_CACHE_DIR:=~/.composer/cache}
: ${COMPOSE_PROJECT_NAME:=ldsk}

docker run -it --rm \
    -v `pwd`:/app \
    -v ~/.ssh:/root/.ssh \
    -v "${COMPOSER_CACHE_DIR}":/root/.composer \
    -w /app \
    ${COMPOSE_PROJECT_NAME}/utility:v1 composer "$@"
