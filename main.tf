provider "aws" {
  region = "ap-southeast-1"
}

data "aws_ami" "al2023" {
    most_recent = true

    owners = [ "amazon" ]

    filter {
      name = "name"
      values = [ "al2023-ami-*-x86_64" ]
    }

    filter {
      name = "state"
      values = [ "available" ]
    }
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.al2023.id
  instance_type = "t3.micro"

  tags = {
    Name = "learn-terraform"
  }
}