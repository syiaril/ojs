FROM php:8.1-fpm

# Install dependencies
RUN apt-get update && apt-get install -y \
    nginx unzip git libzip-dev libpng-dev libfreetype6-dev libjpeg62-turbo-dev \
    && docker-php-ext-install mysqli pdo pdo_mysql zip gd \
    && apt-get clean

WORKDIR /var/www/html

# Copy semua file OJS
COPY . /var/www/html

# Set folder permissions
RUN mkdir -p files cache public && chmod -R 777 files cache public

# Copy konfigurasi nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Jalankan PHP-FPM dan Nginx di foreground
CMD ["sh", "-c", "php-fpm && nginx -g 'daemon off;'"]
