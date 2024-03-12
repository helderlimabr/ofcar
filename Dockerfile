FROM php:8.1-apache

RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    libfreetype6-dev \
    libicu-dev \
    libgmp-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libwebp-dev \
    libxpm-dev \
    libzip-dev \
    unzip \
    zlib1g-dev

RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp
RUN docker-php-ext-configure intl
RUN docker-php-ext-install bcmath calendar exif gd gmp intl mysqli pdo pdo_mysql zip

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

ARG container_project_path
ARG uid
ARG user

WORKDIR $container_project_path

COPY ./.configs/apache.conf /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite

RUN chmod -R 775 $container_project_path
RUN chown -R $user:www-data $container_project_path

USER $user