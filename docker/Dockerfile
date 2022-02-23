FROM php:8.0.3-apache

#Для vps убрать pecl install xdebug и docker-php-ext-enable xdebug
RUN apt-get update && apt-get install -y curl \
        vim\
        zip \
        make \
        cron \
        zlib1g \
        zlib1g-dev \
        libpng-dev \
        libzip-dev \
        libonig-dev \
        libmemcached-dev \
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
    && pecl install memcached \
    && docker-php-ext-enable memcached \
    && apt-get autoremove -y && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/*


RUN echo 'date.timezone = "Europe/Moscow"' >> /usr/local/etc/php/php.ini
#Для local разкомментировать
RUN echo 'xdebug.mode = debug' >> /usr/local/etc/php/php.ini
RUN echo 'xdebug.discover_client_host = 1' >> /usr/local/etc/php/php.ini
RUN echo 'opcache.max_accelerated_files = 20000' >> /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini

RUN echo 'memory_limit = 500M' >> /usr/local/etc/php/php.ini
RUN echo 'upload_max_filesize = 100M' >> /usr/local/etc/php/php.ini
RUN echo 'post_max_size = 100M' >> /usr/local/etc/php/php.ini
RUN echo 'max_execution_time = 600' >> /usr/local/etc/php/php.ini


# Apache config
RUN a2enmod ssl
RUN a2enmod rewrite
RUN a2enmod proxy_wstunnel

# git config
#RUN git config --global user.email "danchiksokol@mail.ru"
#RUN git config --global user.name "Daniel Sokolov"

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#Install Symfony
RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv /root/.symfony/bin/symfony /usr/local/bin/symfony