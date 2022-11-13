#!/bin/bash

# Builds website from source (directory above) by docker image

set -eu

cd "$(dirname "${0}")"

. config

cd "../"

rm -rf ./production

docker run --rm -it \
   -v $(pwd):/src \
   --network host \
   -p 1313:1313 \
   -u $(id -u):$(id -g) \
   "${HUGO_IMAGE}" \
   -d production
