#!/bin/bash

if [ -f .env ]; then
    source .env
fi

: ${COMPOSE_PROJECT_NAME:=ldsk}

docker run -it --rm \
    -v `pwd`:/app \
    -w /app \
    ${COMPOSE_PROJECT_NAME}/utility:v1 phpdoc "$@"