FROM php:7.4-cli
RUN yes '' | pecl install redis-5.3.1 \
    && docker-php-ext-enable redis