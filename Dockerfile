FROM php:7.1-apache

EXPOSE 80

RUN apt-get update && apt-get install -y libicu-dev \
    && docker-php-ext-install -j$(nproc) intl

COPY . /var/www/html/

RUN usermod -u 1000 www-data; \
    a2enmod rewrite; \
    chown -R www-data:www-data /var/www/html/var/
