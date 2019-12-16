#!/bin/bash

if [ -z "$POSTMAN_API_KEY" ]
then
      echo "POSTMAN_API_KEY is empty"
fi

set -e

FILES=collections/*
for f in $FILES
do
  ID=$(basename "$f" ".json")

  curl --location --request PUT https://api.getpostman.com/collections/$ID \
  --header "Content-Type: application/json" \
  --header "X-Api-Key: $POSTMAN_API_KEY" \
  --data @$f
  echo
done
