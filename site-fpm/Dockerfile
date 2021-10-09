FROM php:8.0.3-fpm-alpine3.13

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
RUN apk update && apk add libmcrypt-dev mysql-client autoconf build-base php8-dev
RUN /usr/local/bin/pecl install redis-5.3.4
RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN docker-php-ext-enable redis
