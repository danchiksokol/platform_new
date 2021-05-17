FROM php:8.0.3-apache

RUN apt-get update && apt-get install -y curl \
        zip \
        zlib1g \
        zlib1g-dev \
        libpng-dev \
        libzip-dev \
        libonig-dev \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && docker-php-ext-install gd \
    && docker-php-ext-install zip \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install sockets \
    && docker-php-ext-install pdo_mysql \
    && docker-php-source delete \
    && docker-php-ext-install opcache \
    && docker-php-ext-enable opcache \
    && apt-get autoremove -y && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/*

RUN echo 'date.timezone = "UTC"' >> /usr/local/etc/php/php.ini
RUN echo 'opcache.max_accelerated_files = 20000' >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini

# git config
#RUN git config --global user.email "danchiksokol@mail.ru"
#RUN git config --global user.name "Daniel Sokolov"

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#Install Symfony
RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv /root/.symfony/bin/symfony /usr/local/bin/symfony


RUN a2enmod rewrite