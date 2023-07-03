# Project 2 solution
# 1) Create an EC2 instance
# 2) Attach an elastic IP to the instance
# 3) Output the value of the public IP of the EIP.

# **Terraform block**
terraform {
  required_version = "~> 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Provider Block
provider "aws" {
  region = "us-west-2"
  access_key = "AKIA42FD5YMYERALMYRW"
  secret_key = "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"
}

resource "aws_instance" "ec2" {
  ami           = "ami-0e5b6b6a9f3db6db8"
  instance_type = "t2.micro"
}

# Refer to the arguments section for the EIP (https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip#argument-reference)
resource "aws_eip" "elasticeip" {
  instance = aws_instance.ec2.id
}

# Refer to the attribute section for the EIP (https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip#attributes-reference)
output "EIP" {
  value = aws_eip.elasticeip.public_ip
}
