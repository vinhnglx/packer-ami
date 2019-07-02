#!/bin/bash

read -p "Please enter machine image type (e.g: base, base-docker, base-nginx, base-full-stack): `echo $'\n> '`" image_type

if [[ "$image_type" =~ ^(base|base-docker|base-full-stack|base-nginx)$ ]]; then
  read -p "Enter the instance type: (https://aws.amazon.com/ec2/instance-types/) (e.g: t2.micro): `echo $'\n> '`" instance_type

  read -p "Enter the image name: `echo $'\n> '`" image_name

  read -p "Enter the image description: `echo $'\n> '`" image_description

  read -p "Enter the ami region: (https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.RegionsAndAvailabilityZones.html) (e.g: ap-southeast-1): `echo $'\n> '`" ami_region

  cat $image_type/$image_type.json.tpl | json -e "this.builders[0].instance_type='${instance_type}'" | json -e "this.builders[0].tags.Name='${image_name}'" | json -e "this.builders[0].tags.Description='${image_description}'" | json -e "this.builders[0].ami_name='${image_name}-{{timestamp}}'" | json -e "this.builders[0].ami_regions=['${ami_region}']" > $image_type/$image_type.json
else
  echo "$image_type is not in the list"
fi