docker build -t php:8.3-apache-ubuntu-ssl11 -f Dockerfile.php8apache-deb-ssl11 .
docker image tag php:8.3-apache-ubuntu-ssl11 kiboaleph/php:8.3-apache-ubuntu-ssl11
docker push kiboaleph/php:8.3-apache-ubuntu-ssl11
