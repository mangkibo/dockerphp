docker build -t php:7.4-cli-alpine  -f Dockerfile.php74cli-alp .
docker image tag php:7.4-cli-alpine kiboaleph/php:7.4-cli-alpine-2026
docker push kiboaleph/php:7.4-cli-alpine-2026