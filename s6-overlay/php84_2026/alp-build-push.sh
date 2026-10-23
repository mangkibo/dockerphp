docker build -t php:8.4-serversideup-alp-nginx -f Dockerfile.alp .
docker image tag php:8.4-serversideup-alp-nginx kiboaleph/php:8.4-serversideup-alp-nginx
docker push kiboaleph/php:8.4-serversideup-alp-nginx