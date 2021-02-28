terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

# Some vars. Check variables.auto.tfvars
variable "region" {
  description = "AWS region ex. us-west-2"
}
variable "bucket" {
  description = "AWS S3 bucket name"
}

# S3 Bucket
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket
  tags = {
    Name  = "Flugel"
    Owner = "InfraTeam"
  }
}

output "bucket_id" {
  value = aws_s3_bucket.bucket.id
}

# EC2 Instance
resource "aws_instance" "ec2" {
  ami                    = "ami-005e54dee72cc1d00"
  instance_type          = "t2.micro"

  tags = {
    Name  = "Flugel"
    Owner = "InfraTeam"
  }
}

output "instance_id" {
  value = aws_instance.ec2.id
}
