#!/bin/bash

read -p "Please enter machine image type (e.g: base, base-docker, base-nginx, base-full-stack): `echo $'\n> '`" image_type

if [[ "$image_type" =~ ^(base|base-docker|base-full-stack|base-nginx)$ ]]; then
  packer validate $image_type/$image_type.json
else
  echo "$image_type is not in the list"
fi