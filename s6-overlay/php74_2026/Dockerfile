# Use the serversideup/php-nginx base image
FROM serversideup/php:7.4-fpm-nginx  

# Set environment variable to customize base image
ENV SSL_MODE=off  
ENV DEBIAN_FRONTEND=noninteractive

# Set the working directory to /var/www/html
WORKDIR /var/www/html
RUN mkdir public
RUN echo '<?php phpinfo(); ?>' >> /var/www/html/public/index.php

# in order to change ownership we need change user to root
USER root

# Install locales (kept this from your original script just in case your app needs it)
RUN apt-get update \
    && apt-get install -y --no-install-recommends locales \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Let the script handle EVERYTHING (EULA, OS Dependencies, and Compilation)
RUN install-php-extensions \
    openssl mcrypt gd pdo pdo_mysql mysqli iconv mbstring \
    xml zip intl soap bcmath sqlsrv pdo_sqlsrv pgsql pdo_pgsql

# custom setup for ODBC on /etc/odbcinst.ini
RUN sed -i '1 i\[ODBC]\nPooling=Yes\n' /etc/odbcinst.ini 
RUN sed -i '7 i\CPTimeout=120' /etc/odbcinst.ini 

RUN chown -R www-data:www-data /var/www/html/

# bring back to non-root user
USER www-data

# Expose port 8080 for the Nginx server
EXPOSE 8080