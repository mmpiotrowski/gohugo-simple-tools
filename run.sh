#!/bin/bash

# Run website by hugo docker image

set -eu

cd "$(dirname "${0}")"

. config

HUGO_PARAMS=$(./get-hugo-params.sh)

cd "../"

IP=$(hostname -I | awk '{ print $1 }')

xdg-open "http://$IP:$PORT"

docker run --rm -it \
   -v $(pwd):/src  $HUGO_PARAMS \
   -p ${PORT}:${PORT} \
   -u $(id -u):$(id -g) \
   --entrypoint "/bin/bash" \
   "${HUGO_IMAGE}" \
   -c "yarn install && ./node_modules/.bin/tailwindcss -i ./themes/tella/assets/css/main.css -o ./themes/tella/assets/css/style.css &&  hugo server \
   --environment development \
   --destination development \
   --port ${PORT} \
   --disableFastRender \
   --buildFuture \
   --buildDrafts \
   --baseURL http://$IP \
   --noBuildLock \
   --cleanDestinationDir"