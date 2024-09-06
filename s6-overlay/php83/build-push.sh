docker build -t php:8.3-serversideup -f Dockerfile .
docker image tag php:8.3-serversideup kiboaleph/php:8.3-serversideup
docker push kiboaleph/php:8.3-serversideup