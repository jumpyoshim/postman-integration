#!/bin/bash

postman_api_key="PMAK-5ddc9ba283713d0030dc6c54-2d1de597eadfa149159833c23b32df848e"

curl --location --request POST "https://api.getpostman.com/import/exported" \
  --header "x-api-key: $postman_api_key" \
  --form "type=file" \
  --form "input=@bd173cf1-0827-4908-9206-1dec07f605e7.zip"
