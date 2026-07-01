docker build -t kibophp:8.4-serversideup-v1.0.0 -f Dockerfile .
docker image tag kibophp:8.4-serversideup-v1.0.0 kiboaleph/php:8.4-serversideup-v1.0.0
docker push kiboaleph/php:8.4-serversideup-v1.0.0