FROM php:8.1-fpm

RUN apt-get update && apt-get install -y \
    nginx unzip git libzip-dev libpng-dev libfreetype6-dev libjpeg62-turbo-dev \
    && docker-php-ext-install mysqli pdo pdo_mysql zip gd

WORKDIR /var/www/html

# Copy semua file OJS (karena ada di root repo)
COPY . /var/www/html/

RUN mkdir -p files cache public && \
    chown -R www-data:www-data /var/www/html && \
    chmod -R 775 /var/www/html

COPY nginx.conf /etc/nginx/nginx.conf
COPY php.ini /usr/local/etc/php/conf.d/php.ini

EXPOSE 80

CMD service nginx start && php-fpm
