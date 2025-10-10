docker build -t kibophp:8.3-serversideup-2025 -f Dockerfile .
docker image tag kibophp:8.3-serversideup-2025 kiboaleph/php:8.3-serversideup-2025
docker push kiboaleph/php:8.3-serversideup-2025