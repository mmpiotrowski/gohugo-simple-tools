#!/bin/bash

# Builds website from source (directory above) by docker image

set -eu

cd "$(dirname "${0}")"

. config

HUGO_PARAMS=$(./get-hugo-params.sh)

cd "../"

docker run --rm \
   -v $(pwd):/src $HUGO_PARAMS \
   --network host \
   -p 1313:1313 \
   --entrypoint "/bin/bash" \
   "${HUGO_IMAGE}" \
   -c "yarn install && ./node_modules/.bin/tailwindcss -i ./themes/tella/assets/css/main.css -o ./themes/tella/assets/css/style.css &&  hugo --verbose \
   --environment production \
   --destination production\
   --cleanDestinationDir \
   --baseURL https://${DOMAIN_NAME}"
   
