docker build -t php:8.3-cli-alpine -f Dockerfile.php8cli-alp .
docker image tag php:8.3-cli-alpine kiboaleph/php:8.3-cli-alpine
docker push kiboaleph/php:8.3-cli-alpine