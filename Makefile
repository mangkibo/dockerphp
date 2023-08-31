build.php74: build.php74.apache.ubuntu build.php74.apache.ubuntu

build.php82: build.php82.apache.ubuntu build.php82.nginx.alpine build.php82.cli.alpine


build.php74.apache.ubuntu:
	(cd php74 && docker build --platform linux/amd64 -t kiboaleph/php:7.4-apache-ubuntu -f Dockerfile.php74apache-deb . )

build.php74.cli.alpine:
	(cd php74 && docker build --platform linux/amd64 -t kiboaleph/php:7.4-cli-alpine -f Dockerfile.php74cli-alp . )

build.php82.apache.ubuntu:
	(cd php82 && docker build --platform linux/amd64 -t kiboaleph/php:8.2-apache-ubuntu -f Dockerfile.php8apache-deb . )

build.php82.nginx.alpine:
	(cd php82 && docker build --platform linux/amd64 -t kiboaleph/php:8.2-nginx-alpine -f Dockerfile.php8nginx-alp . )

build.php82.cli.alpine:
	(cd php82 && docker build --platform linux/amd64 -t kiboaleph/php:8.2-cli-alpine -f Dockerfile.php8cli-alp . )