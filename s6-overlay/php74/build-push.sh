docker build -t php:7.4-serversideup -f Dockerfile .
docker image tag php:7.4-serversideup kiboaleph/php:7.4-serversideup
docker push kiboaleph/php:7.4-serversideup