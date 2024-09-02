docker build -t php:8.3cli-alpine -f Dockerfile.php8cli-alp .
docker image tag php:8.3cli-alpine kiboaleph/php:8.3cli-alpine
docker push kiboaleph/php:8.3cli-alpine