#!/usr/bin/env sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
image="kiboaleph/php:8.4-serversideup"

docker buildx build \
  --builder dockerphp-builder \
  --platform linux/amd64 \
  --pull --load \
  --file "$script_dir/Dockerfile" \
  --tag "$image" \
  "$script_dir"

# Only publish a PHP 8.4 image containing the security fixes.
docker run --rm --pull=never --platform linux/amd64 --entrypoint php "$image" \
  -r 'echo PHP_VERSION, PHP_EOL; exit(PHP_VERSION_ID >= 80427 && PHP_VERSION_ID < 80500 ? 0 : 1);'

docker push "$image"
