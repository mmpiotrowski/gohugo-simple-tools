#!/bin/bash

# Run website by hugo docker image

set -eu

cd "$(dirname "${0}")"

. config

HUGO_PARAMS=$(./get-hugo-params.sh)

cd "../"

# rm -rf ./development

IP=$(hostname -I | awk '{ print $1 }')

docker run --rm -it \
   -v $(pwd):/src  $HUGO_PARAMS \
   -p ${PORT}:${PORT} \
   -u $(id -u):$(id -g) \
   "${HUGO_IMAGE}" \
   server \
   --environment development \
   --destination development\
   --port ${PORT} \
   --disableFastRender \
   --buildFuture \
   --buildDrafts \
   --baseURL http://$IP \
   --noBuildLock \
   --cleanDestinationDir
