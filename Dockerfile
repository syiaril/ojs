FROM php:8.1-fpm

# Install dependencies needed by OJS
RUN apt-get update && apt-get install -y \
    nginx unzip git libzip-dev libpng-dev libfreetype6-dev libjpeg62-turbo-dev \
    && docker-php-ext-install mysqli pdo pdo_mysql zip gd

WORKDIR /var/www/html

# Copy OJS source code
COPY ojs/ /var/www/html/

# Create required directories and set permissions
RUN mkdir -p files cache public && \
    chown -R www-data:www-data /var/www/html && \
    chmod -R 775 /var/www/html

# Copy custom nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Custom PHP configuration
COPY php.ini /usr/local/etc/php/conf.d/php.ini

EXPOSE 80

CMD service nginx start && php-fpm
