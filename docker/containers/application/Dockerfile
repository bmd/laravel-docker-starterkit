FROM php:5.6-fpm

RUN apt-get update
RUN apt-get install -y libpq-dev libpq5 wget

# Databases
RUN docker-php-ext-install pdo_mysql

# Phpunit
RUN wget https://phar.phpunit.de/phpunit.phar &&\
    chmod +x phpunit.phar &&\
    mv phpunit.phar /usr/local/bin/phpunit

# Setup phpunit dependencies (including optional)
RUN pecl install xdebug && \
    docker-php-ext-enable xdebug