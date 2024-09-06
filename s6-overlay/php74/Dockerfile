# Use the serversideup/php-nginx base image
FROM serversideup/php:7.4-fpm-nginx  

# Set environment variable to customize base image
# see more https://serversideup.net/open-source/docker-php/docs/reference/environment-variable-specification
ENV SSL_MODE off  

ENV DEBIAN_FRONTEND=noninteractive

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Copy the Laravel app files to the container
# COPY . .

# in order to change ownership we need change user to root
USER root

# install SQL Server Driver
RUN apt-get update \
    && apt-get install -y gnupg2 \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get install -y --no-install-recommends \
      locales \
        apt-transport-https \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
        unixodbc unixodbc-dev \
        msodbcsql17

RUN pecl install sqlsrv pdo_sqlsrv
RUN docker-php-ext-enable sqlsrv pdo_sqlsrv

RUN install-php-extensions openssl mcrypt gd pdo pdo_mysql mysqli iconv mbstring xml zip intl soap bcmath

# custom setup for ODBC on /etc/odbcinst.ini
RUN sed -i '1 i\[ODBC]\nPooling=Yes\n' /etc/odbcinst.ini 
RUN sed -i '7 i\CPTimeout=120' /etc/odbcinst.ini 

RUN chown -R www-data:www-data /var/www/html/

# bring back to non-root user
USER www-data

# Install PHP dependencies
# RUN composer install 

# Expose port 8080 for the Nginx server
EXPOSE 8080