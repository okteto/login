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
echo PATH
echo $PWD
echo HOME
echo $HOME
echo FOLDER
ls -al /github/home
echo OKTETO
which okteto

sudo rm -Rf /github/home/.okteto

echo running: okteto login --token=$token $url
okteto login --token=$token $url 
