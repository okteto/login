#!/bin/sh
set -e

token=$1
url=$2

if [ -z $token ]; then
  echo "Okteto API token is required"
  exit 1
fi

if [[ ! -z "$CUSTOM_CERTIFICATE" ]]; then
  echo "Custom certificate is provided"
  echo "$CUSTOM_CERTIFICATE" > /usr/local/share/ca-certificates/custom_certificate_crt
  update-ca-certificates
fi

echo running: okteto login --token=$token $url
okteto login --token=$token $url 
