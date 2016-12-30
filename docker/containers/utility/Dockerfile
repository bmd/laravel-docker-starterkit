FROM php:5.6-cli

# Install PhpDocumentor
RUN pear channel-discover pear.phpdoc.org && \
    pear install phpdoc/phpDocumentor

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl \
    git \
    unzip \
    wget \
  && rm -r /var/lib/apt/lists/*

# Install Composer
# Solution based on:
# https://github.com/RobLoach/docker-composer/blob/master/base/Dockerfile
RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/local/bin --filename=composer

# Allow Composer to be run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

