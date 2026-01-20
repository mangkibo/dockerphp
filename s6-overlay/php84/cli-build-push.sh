docker build -t php:8.4-serversideup-alp-cli -f Dockerfile.cli-alp .
docker image tag php:8.4-serversideup-alp-cli kiboaleph/php:8.4-serversideup-alp-cli
docker push kiboaleph/php:8.4-serversideup-alp-cli