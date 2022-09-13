terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region  = "eu-west-3"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0f7559f51d3a22167"
  count         = 2
  instance_type = "t2.micro"

  tags = {
    Name = "AppServer-${count.index}"
    OS   = "ubuntu"
  }
}
