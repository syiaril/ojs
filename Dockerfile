FROM php:8.1-fpm

RUN apt-get update && apt-get install -y \
    nginx unzip git libzip-dev libpng-dev libfreetype6-dev libjpeg62-turbo-dev libicu-dev \
    && docker-php-ext-install mysqli pdo pdo_mysql zip gd intl

WORKDIR /var/www/html

COPY . /var/www/html

RUN mkdir -p files cache public && chmod -R 777 files cache public

COPY nginx.conf /etc/nginx/conf.d/default.conf

CMD ["bash", "-c", "php-fpm & nginx -g 'daemon off;'"]
