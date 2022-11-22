#!/bin/bash

# Run website by hugo docker image

set -eu

cd "$(dirname "${0}")"

. config

HUGO_PARAMS=$(./get-hugo-params.sh)

cd "../"

rm -rf ./development

docker run --rm -it \
   -v $(pwd):/src  $HUGO_PARAMS \
   -p ${PORT}:${PORT} \
   -u $(id -u):$(id -g) \
   "${HUGO_IMAGE}" \
   server \
   --port ${PORT} \
   --disableFastRender \
   -d ./development
