FROM php:7.2-fpm

ENV WORKDIR "/code"
RUN mkdir -p ${WORKDIR}

# -- Install common tools and libraries
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    file \
    curl \
    git \
    zip \
    unzip \
    vim \
    openssl \
    #PHP intl module
    libicu-dev \
    #PHP image module + libs
    libjpeg-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libgd-dev \
    #PHP zip module
    libz-dev \
    zlib1g-dev

# -- Install PHP database modules
RUN docker-php-ext-install pdo pdo_mysql mysqli

# -- Install PHP intl module
RUN docker-php-ext-configure intl \
	&& docker-php-ext-install intl

# -- Install PHP Image module and libraries
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install gd \
	&& docker-php-ext-install exif

# -- Install PHP String module
RUN docker-php-ext-install mbstring

# -- Install Xdebug and Redis
#RUN docker-php-source extract \
#    && pecl install xdebug-alpha redis \
#    && docker-php-ext-enable xdebug redis \
#    && docker-php-source delete

# -- PHP Zip Archive
RUN docker-php-ext-install zip

# -- Use the default dev/production configuration
#RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

#COPY ./conf/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
#COPY ./conf/php.ini /usr/local/etc/php/conf.d/php.ini

# -- Install composer
RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/local/bin --filename=composer

# -- Set your timezone here
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
RUN "date"

# -- Clean
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/*

# -- Copy over entrypoint
COPY ./docker-entrypoint.sh /

# -- Change current user to www-data
USER www-data

# -- Copy application src to workdir
WORKDIR ${WORKDIR}
COPY --chown=www-data:www-data ./src ${WORKDIR}

# -- Run entrypoint script
ENTRYPOINT ["/docker-entrypoint.sh"]
