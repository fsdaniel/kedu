#!/bin/bash

# -- run php artisan
php artisan config:cache
php artisan migrate

# -- start php-fpm process
php-fpm
