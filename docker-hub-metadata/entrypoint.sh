#!/bin/bash
# 
# Post a repo's README.md file as repo description (Full Description)
# on Docker Hub.

set -eu

token(){
  TOKEN=$(curl -s -X POST \
    -H "Content-Type: application/json" \
    -d '{"username": "'"$DOCKER_USERNAME"'", "password": "'"$DOCKER_PASSWORD"'"}' \
    https://hub.docker.com/v2/users/login/ | jq -r .token)
}

filetest(){
  if [[ -f "README.md" ]]; then 
    echo "Found README.md and it's a file .."
  else
    echo "Could not find a README.md file in the workspace .."
    exit 1
  fi
}

metadata(){
  token
  code=$(jq -n --arg msg "$(<README.md)" \
    '{"registry":"registry-1.docker.io","full_description": $msg }' | \
    curl -s -o /dev/null  -L -w "%{http_code}" \
      https://cloud.docker.com/v2/repositories/"${IMAGE}"/ \
      -d @- -X PATCH \
      -H "Content-Type: application/json" \
      -H "Authorization: JWT ${TOKEN}")

  if [[ "${code}" = "200" ]]; then
    echo "Successfully pushed README.md to Docker Hub."
  else
    echo "Unable to push README.md to Docker Hub, response code: ${code}"
    exit 1
  fi
}

filetest
metadata

exit $?
