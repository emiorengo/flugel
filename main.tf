terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.32"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}
/*
###############################################################################
#################################  Test1  #####################################
###############################################################################

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
*/
###############################################################################
#################################  Test2  #####################################
###############################################################################

# VPC
resource "aws_vpc" "VPC" {
  cidr_block           = var.vpcCIDRblock
  instance_tenancy     = var.instanceTenancy
  enable_dns_support   = var.dnsSupport
  enable_dns_hostnames = var.dnsHostNames
}

# Default gateway
resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.VPC.id
}

# Routing
resource "aws_route" "internet_access" {
  route_table_id         = aws_vpc.VPC.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.default.id
}

# Subnet1
resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.subnetCIDRblock1
  #Don't forget comment public IP
  map_public_ip_on_launch = var.mapPublicIP
  availability_zone       = var.availabilityZone1
}

# Subnet2
resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.subnetCIDRblock2
  map_public_ip_on_launch = var.mapPublicIP
  availability_zone       = var.availabilityZone2
}

# Security group for my ec2 instances
resource "aws_security_group" "ec2_sg" {
  name        = "ec2_sg"
  vpc_id      = aws_vpc.VPC.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Private Key for ec2
resource "tls_private_key" "privatekey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Key pair
resource "aws_key_pair" "generated_key" {
  key_name   = "keys"
  public_key = tls_private_key.privatekey.public_key_openssh
  //public_key = file(var.public_key_path)
}

# EC2 Instance 1
resource "aws_instance" "ec2_1" {
  ami                    = "ami-005e54dee72cc1d00"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = aws_key_pair.generated_key.key_name
  user_data              = data.template_cloudinit_config.config1.rendered
  tags = {
    Name  = "Flugel"
    Owner = "InfraTeam"
  }
}

data "template_file" "client1" {
  template = file("./script.sh")
}

data "template_cloudinit_config" "config1" {
  gzip          = false
  base64_encode = false
  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.client1.rendered
  }
}
output "instance_id1" {
  value = aws_instance.ec2_1.id
}

# EC2 Instance 2
resource "aws_instance" "ec2_2" {
  ami                    = "ami-005e54dee72cc1d00"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet2.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = aws_key_pair.generated_key.key_name
  user_data              = data.template_cloudinit_config.config2.rendered
  tags = {
    Name  = "Flugel"
    Owner = "InfraTeam"
  }
}

data "template_file" "client2" {
  template = file("./script.sh")
}

data "template_cloudinit_config" "config2" {
  gzip          = false
  base64_encode = false
  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.client2.rendered
  }
}
output "instance_id2" {
  value = aws_instance.ec2_2.id
}

# ALB
resource "aws_alb" "alb" {
  name            = "my-alb"
  subnets         = [aws_subnet.subnet1.id,aws_subnet.subnet2.id]
  security_groups = [aws_security_group.ec2_sg.id]
  internal        = false
  depends_on = [aws_instance.ec2_1, aws_instance.ec2_2]
}
output "alb_dns_name" {
  value = aws_alb.alb.dns_name
}
# ALB Listener
resource "aws_alb_listener" "alb_listener" {
  load_balancer_arn = aws_alb.alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_alb_target_group.alb_target.arn
    type             = "forward"
  }
}
# ALB Target group
resource "aws_alb_target_group" "alb_target" {
  name     = "alb-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.VPC.id
}
# ALB tg instance 1
resource "aws_alb_target_group_attachment" "tg-ec2-1" {
  target_group_arn = aws_alb_target_group.alb_target.arn
  target_id        = aws_instance.ec2_1.id
  port             = 80
}
# ALB tg instance 2
resource "aws_alb_target_group_attachment" "tg-ec2-2" {
  target_group_arn = aws_alb_target_group.alb_target.arn
  target_id        = aws_instance.ec2_2.id
  port             = 80
}
