FROM php:7.4-fpm-alpine

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
RUN apk update && apk add libmcrypt-dev mysql-client 
RUN docker-php-ext-install pdo pdo_mysql 
