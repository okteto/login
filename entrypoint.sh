#!/bin/sh
set -e

token=$1
url=$2

if [[ ! -z "$OKTETO_CA_CERT" ]]; then
  echo "Custom certificate is provided"
  echo "$OKTETO_CA_CERT" > /usr/local/share/ca-certificates/okteto_ca_cert
  update-ca-certificates
fi

if [ -z $token ]; then
  echo "Okteto API token is required"
  exit 1
fi

echo running: okteto login --token=$token $url
okteto login --token=$token $url 