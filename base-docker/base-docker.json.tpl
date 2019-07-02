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
  }],
  "provisioners": [
    {
      "type": "file",
      "source": "base-docker/docker_setup.sh",
      "destination": "/tmp/docker_setup.sh"
    },
    {
      "type": "file",
      "source": "base-docker/cleanup.sh",
      "destination": "/tmp/cleanup.sh"
    },
    {
      "type": "shell",
      "execute_command": "echo 'packer' | sudo -S sh -c '{{ .Vars }} {{ .Path }}'",
      "inline": [
        "whoami",
        "cd /tmp",
        "chmod +x docker_setup.sh",
        "chmod +x cleanup.sh",
        "ls -alh /tmp",
        "./docker_setup.sh",
        "sleep 10",
        "./cleanup.sh"
      ]
    }
  ]
}