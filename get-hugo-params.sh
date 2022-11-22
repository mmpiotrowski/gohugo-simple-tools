set -eu

cd "$(dirname "${0}")"

HUGO_PARAMS=''
if [ -f hugo_params ];then
   while read param; do
      HUGO_PARAMS+="-e $param "
   done <hugo_params
fi

echo -e "${HUGO_PARAMS}"
