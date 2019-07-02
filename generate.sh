#!/bin/bash

echo "Generate AWS Credential configuration"

read -p "Enter AWS Access Key: `echo $'\n> '`" aws_access_key

read -p "Enter AWS Secret Key: `echo $'\n> '`" aws_secret_key

printf "{\n\"aws_access_key\": \"${aws_access_key}\",\n\"aws_secret_key\": \"${aws_secret_key}\"\n}" > json-credential.json
