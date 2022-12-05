#!/bin/bash

# Builds website from source (directory above) by docker image

set -eu

cd "$(dirname "${0}")"

. config

HUGO_PARAMS=$(./get-hugo-params.sh)

cd "../"

docker run --rm -it \
   -v $(pwd):/src $HUGO_PARAMS \
   --network host \
   -p 1313:1313 \
   -u $(id -u):$(id -g) \
   "${HUGO_IMAGE}" \
   --environment production \
   --destination production \
   --cleanDestinationDir
