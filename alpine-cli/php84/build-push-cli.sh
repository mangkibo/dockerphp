docker build -t php:8.4-cli-alpine -f Dockerfile.php8cli-alp .
docker image tag php:8.4-cli-alpine kiboaleph/php:8.4-cli-alpine
docker push kiboaleph/php:8.4-cli-alpine