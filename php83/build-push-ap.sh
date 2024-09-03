docker build -t php:8.3-apache-ubuntu -f Dockerfile.php8apache-deb .
docker image tag php:8.3-apache-ubuntu kiboaleph/php:8.3-apache-ubuntu
docker push kiboaleph/php:8.3-apache-ubuntu