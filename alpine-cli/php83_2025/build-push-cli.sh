docker build -t php:8.3-cli-alpine-2025 -f Dockerfile.php8cli-alp .
docker image tag php:8.3-cli-alpine-2025 kiboaleph/php:8.3-cli-alpine-2025
docker push kiboaleph/php:8.3-cli-alpine-2025