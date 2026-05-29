docker build -t php:7.4-cli-alpine-2026-v2  -f Dockerfile.php74cli-alp .
docker image tag php:7.4-cli-alpine-2026-v2 kiboaleph/php:7.4-cli-alpine-2026-v2
docker push kiboaleph/php:7.4-cli-alpine-2026-v2