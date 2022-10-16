#!/bin/bash

# install theme from repo and sets version

set -eu

cd "$(dirname "${0}")"

. config

cd "../themes"

git clone --branch "${THEME_VERSION}" "${THEME_REPO}" 

