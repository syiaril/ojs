FROM php:8.1-fpm

# Install dependencies OJS
RUN apt-get update && apt-get install -y \
    nginx unzip git libzip-dev libpng-dev libfreetype6-dev libjpeg62-turbo-dev \
    && docker-php-ext-install mysqli pdo pdo_mysql zip gd

# Copy OJS ke container
WORKDIR /var/www/html
COPY . /var/www/html

# Permissions
RUN mkdir -p files cache public && \
    chown -R www-data:www-data /var/www/html && \
    chmod -R 775 /var/www/html

# Copy nginx config
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD service nginx start && php-fpm
