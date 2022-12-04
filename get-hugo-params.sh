# Fetches variables from a file and passes them to the container
set -eu

cd "$(dirname "${0}")"

HUGO_PARAMS=''
if [ -f hugo_params ];then
   while read param; do
      HUGO_PARAMS+="-e $param "
   done <hugo_params
fi

for param in $(env | grep HUGO_PARAMS); do
      HUGO_PARAMS+="-e $param "
done

echo -e "${HUGO_PARAMS}"
