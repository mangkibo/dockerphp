# Use the serversideup/php-nginx base image
FROM serversideup/php:8.4-fpm-nginx

# Require the fixes for CVE-2026-109618 and CVE-2026-109619.
RUN php -r 'echo PHP_VERSION, PHP_EOL; exit(PHP_VERSION_ID >= 80427 && PHP_VERSION_ID < 80500 ? 0 : 1);'

# Set environment variable
ENV SSL_MODE=off  
ENV TZ=Asia/Jakarta
ENV SESSION_SECURE_COOKIE=true

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
ARG SQLSRV_VERSION=5.13.3
ARG IMAGICK_VERSION=3.8.1
ARG MCRYPT_VERSION=1.0.9
ARG MONGODB_VERSION=2.5.5
# Prepare local sources so PECL does not need to resolve channel metadata.
RUN set -eux; \
    mkdir -p /tmp/php-extensions; \
    for package in "sqlsrv-${SQLSRV_VERSION}" "pdo_sqlsrv-${SQLSRV_VERSION}" \
        "imagick-${IMAGICK_VERSION}" "mcrypt-${MCRYPT_VERSION}" "mongodb-${MONGODB_VERSION}"; do \
        curl -fsSL --retry 5 --retry-all-errors --connect-timeout 15 --max-time 120 \
            -o "/tmp/${package}.tgz" "https://pecl.php.net/get/${package}.tgz"; \
        tar -xzf "/tmp/${package}.tgz" -C /tmp/php-extensions; \
        mv /tmp/php-extensions/package.xml "/tmp/php-extensions/${package}/package.xml"; \
        rm "/tmp/${package}.tgz"; \
    done

RUN set -eux; \
    install-php-extensions \
        "/tmp/php-extensions/sqlsrv-${SQLSRV_VERSION}" \
        "/tmp/php-extensions/pdo_sqlsrv-${SQLSRV_VERSION}" \
        "/tmp/php-extensions/imagick-${IMAGICK_VERSION}" \
        "/tmp/php-extensions/mcrypt-${MCRYPT_VERSION}" \
        "/tmp/php-extensions/mongodb-${MONGODB_VERSION}" \
        openssl gd pdo pdo_mysql mysqli iconv mbstring xml zip intl soap bcmath pdo_pgsql pgsql; \
    rm -rf /tmp/php-extensions

# Custom setup for ODBC on /etc/odbcinst.ini
# Kita perlu memastikan file ini ada/dibuat setelah installasi driver
RUN sed -i '1 i\[ODBC]\nPooling=Yes\n' /etc/odbcinst.ini \
    && sed -i '7 i\CPTimeout=120' /etc/odbcinst.ini

# Fix permissions
RUN chown -R www-data:www-data /var/www/html/

# Switch back to non-root user
USER www-data

EXPOSE 8080
