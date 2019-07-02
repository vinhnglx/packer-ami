{
  "variables": {
    "aws_access_key": "",
    "aws_secret_key": ""
  },
  "builders": [{
    "type": "amazon-ebs",
    "access_key": "{{user `aws_access_key`}}",
    "secret_key": "{{user `aws_secret_key`}}",
    "region": "us-east-1",
    "source_ami_filter": {
      "filters": {
        "virtualization-type": "hvm",
        "name": "ubuntu/images/*ubuntu-bionic-18.04-amd64-server-*",
        "root-device-type": "ebs"
      },
      "owners": ["099720109477"],
      "most_recent": true
    },
    "tags": {
      "Name": "Name",
      "Description": "Description"
    },
    "instance_type": "t2.micro",
    "ssh_username": "ubuntu",
    "ami_name": "name-{{timestamp}}",
    "ami_regions": ["ap-southeast-1"]
  }]
}