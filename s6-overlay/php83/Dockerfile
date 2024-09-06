# Use the serversideup/php-nginx base image
FROM serversideup/php:8.3-fpm-nginx  

# Set environment variable to customize base image
# see more https://serversideup.net/open-source/docker-php/docs/reference/environment-variable-specification
ENV SSL_MODE off  

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Copy the Laravel app files to the container
# COPY . .

# in order to change ownership we need change user to root
USER root

# install some dependencies
#RUN apt-get update && apt-get install -y gnupg2 \
#    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
#    && curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list > /etc/apt/sources.list.d/mssql-release.list \
#    && apt-get update \
#    && ACCEPT_EULA=Y apt-get -y --no-install-recommends install msodbcsql17 unixodbc-dev \
#    && pecl install sqlsrv \
#    && pecl install pdo_sqlsrv \
#    && docker-php-ext-enable sqlsrv pdo_sqlsrv

ENV ACCEPT_EULA=Y

RUN apt-get update && apt-get install -y gnupg2 \
    curl https://packages.microsoft.com/keys/microsoft.asc | tee /etc/apt/trusted.gpg.d/microsoft.asc \
    curl https://packages.microsoft.com/config/debian/11/prod.list | tee /etc/apt/sources.list.d/mssql-release.list \
    apt-get update \
    apt-get install msodbcsql18 mssql-tools18 -y \
    echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc \
    source ~/.bashrc \
    apt-get install unixodbc-dev libgssapi-krb5-2 -y

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