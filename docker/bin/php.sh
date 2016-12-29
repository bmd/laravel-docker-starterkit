#!/bin/bash

docker run -it --rm \
    -v `pwd`:/app \
    -w /app \
    authentication/utility:v1 php "$@"
