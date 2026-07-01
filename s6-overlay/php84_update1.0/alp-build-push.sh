docker build -t php:8.4-serversideup-alp-nginx-v1.0.0 -f Dockerfile.alp .
docker image tag php:8.4-serversideup-alp-nginx-v1.0.0 kiboaleph/php:8.4-serversideup-alp-nginx-v1.0.0
docker push kiboaleph/php:8.4-serversideup-alp-nginx-v1.0.0