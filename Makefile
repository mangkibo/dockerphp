########################################
# author: kibo
# date : 6 November 2023
# email : herdiyudha.yusuf@gmail.com 
########################################

# define docker base path
path = kiboaleph

# define docker image name
php74apache_ubuntu = php:7.4-apache-ubuntu
php74cli_alpine = php:7.4-cli-alpine
php82apache_ubuntu = php:8.2-apache-ubuntu
php82nginx_alpine = php:8.2-nginx-alpine
php82cli_alpine = php:8.2-cli-alpine

build.php74: build.php74.apache.ubuntu build.php74.apache.ubuntu
build.php82: build.php82.apache.ubuntu build.php82.nginx.alpine build.php82.cli.alpine

build.php74.apache.ubuntu:
	( cd php74 && docker build --platform linux/amd64 -t $(path)/$(php74apache_ubuntu) -f Dockerfile.php74apache-deb . )

build.php74.cli.alpine:
	( cd php74 && docker build --platform linux/amd64 -t $(path)/$(php74cli_alpine) -f Dockerfile.php74cli-alp . )

build.php82.apache.ubuntu:
	( cd php82 && docker build --platform linux/amd64 -t $(path)/$(php82apache_ubuntu) -f Dockerfile.php8apache-deb . )

build.php82.nginx.alpine:
	( cd php82 && docker build --platform linux/amd64 -t $(path)/$(php82nginx_alpine) -f Dockerfile.php8nginx-alp . )

build.php82.cli.alpine:
	( cd php82 && docker build --platform linux/amd64 -t $(path)/$(php82cli_alpine) -f Dockerfile.php8cli-alp . )

push.php74.apache.ubuntu:
	( docker push $(path)/$(php74apache_ubuntu) )

push.php74.cli.alpine:
	( docker push $(path)/$(php74cli_alpine) )

push.php82.apache.ubuntu:
	( docker push $(path)/$(php82apache_ubuntu) )

push.php82.nginx.alpine:
	( docker push $(path)/$(php82nginx_alpine) )

push.php82.cli.alpine:
	( docker push $(path)/$(php82cli_alpine) )