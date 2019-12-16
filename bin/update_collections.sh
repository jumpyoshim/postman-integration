#!/bin/bash

if [ -z "$POSTMAN_API_KEY" ]
then
      echo "POSTMAN_API_KEY is empty"
fi

set -e

FILES="/tmp/*"
for f in $FILES
do
  ID=$(cmd < "$f" | python3 -c "import sys, json; print(json.load(sys.stdin)['collection']['info']['_postman_id'])")

  curl --location --request PUT https://api.getpostman.com/collections/"$ID" \
  --header "Content-Type: application/json" \
  --header "X-Api-Key: $POSTMAN_API_KEY" \
  --data @"$f"
  echo
done
