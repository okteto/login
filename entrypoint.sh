#!/bin/sh
set -el

token=$1
url=$2

if [ -z $token ]; then
  echo "Okteto API token is required"
  exit 1
fi


export OKTETO_HOME=$RUNNER_TEMP
mkdir -p $OKTETO_HOME
echo running: okteto login --token=$token $url
okteto login -l=debug --token=$token $url 
