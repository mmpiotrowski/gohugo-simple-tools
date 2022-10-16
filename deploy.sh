#!/bin/bash

# Deoply directory ../public to AWS S3 and clean all cloudfront cache

set -eu

cd "$(dirname "${0}")"

. config

cd "../"

aws s3 sync ./public "s3://${S3_BUCKET}/"
# TODO cloundfornt optional ?
aws cloudfront create-invalidation --distribution-id "${CLOUDFRONT_DISITRIBUTION_ID}" --paths "/*"
#TODO cleaon old js files?