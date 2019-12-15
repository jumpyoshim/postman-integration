#!/bin/bash

source .env
echo $POSTMAN_API_KEY
if [ -z "$POSTMAN_API_KEY" ]
then
      echo "POSTMAN_API_KEY is empty"
fi

FILES=collections/*
for f in $FILES
do
  echo "Processing $f file..."
  ID=$(basename "$f" ".json")

  curl --location --request PUT https://api.getpostman.com/collections/$ID \
  --header "Content-Type: application/json" \
  --header "X-Api-Key: $POSTMAN_API_KEY" \
  --data @$f
done
