FROM php:5.6-fpm

MAINTAINER Colt Xie <colt.xie@gmail.com>

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
	&& sed -i 's/httpredir.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
    && sed -i 's|security.debian.org|mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list
RUN apt update -y && apt -y install libcurl4-openssl-dev \
		libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng12-dev \
        libmcrypt-dev \
        libmemcached-dev \
        zlib1g-dev
RUN docker-php-ext-install curl gd mcrypt iconv mbstring mysql mysqli opcache pdo_mysql
RUN printf "\n" | pecl install memcached && docker-php-ext-enable memcached
RUN printf "\n" | pecl install redis && docker-php-ext-enable redis
RUN printf "\n" | pecl install xdebug && echo "zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20131226/xdebug.so" > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && echo "xdebug.remote_enable = 1 \n\
xdebug.remote_connect_back = 1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
