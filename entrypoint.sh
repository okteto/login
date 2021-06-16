#!/bin/sh
set -e

token=$1
url=$2

if [ -z $token ]; then
  echo "Okteto API token is required"
  exit 1
fi

echo USER
whoami
echo FOLDER
ls -al /github/home

echo running: okteto login --token=$token $url
okteto login --token=$token $url 