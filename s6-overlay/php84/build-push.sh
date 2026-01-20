docker build -t kibophp:8.4-serversideup -f Dockerfile .
docker image tag kibophp:8.4-serversideup kiboaleph/php:8.4-serversideup
docker push kiboaleph/php:8.4-serversideup