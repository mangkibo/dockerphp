# Use the serversideup/php-nginx base image
FROM serversideup/php:8.4-fpm-nginx

# Set environment variable
ENV SSL_MODE=off  
ENV TZ=Asia/Jakarta

# WORKDIR setup
WORKDIR /var/www/html
RUN mkdir -p public
RUN echo '<?php phpinfo(); ?>' > /var/www/html/public/index.php

# Switch to root to install extensions
USER root

# 1. Install 'install-php-extensions' binary
# Ini adalah cara paling efisien untuk install ekstensi di Docker
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

# 2. Install Utilites (Optional but good)
RUN apt-get update && apt-get install -y \
    git vim nano procps telnet iputils-ping traceroute \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 3. Install SQLSRV, ODBC, and other extensions
# Script ini akan otomatis mendownload Microsoft ODBC Driver 18
# dan mengkonfigurasi php.ini secara otomatis.
RUN install-php-extensions \
    sqlsrv \
    pdo_sqlsrv \
    imagick \
    openssl mcrypt gd pdo pdo_mysql mysqli \
    iconv mbstring xml zip intl soap bcmath \
    mongodb pdo_pgsql pgsql

# Custom setup for ODBC on /etc/odbcinst.ini
# Kita perlu memastikan file ini ada/dibuat setelah installasi driver
RUN sed -i '1 i\[ODBC]\nPooling=Yes\n' /etc/odbcinst.ini \
    && sed -i '7 i\CPTimeout=120' /etc/odbcinst.ini

# Fix permissions
RUN chown -R www-data:www-data /var/www/html/

# Switch back to non-root user
USER www-data

EXPOSE 8080