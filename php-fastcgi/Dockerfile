FROM php:7.4-fpm
ARG CODE_VERSION=${CODE_VERSION:-1.0}
# Lets install the GD extention also for fun.
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

COPY src/ /usr/src/myapp
WORKDIR /usr/src/myapp

CMD ["php-fpm"]
