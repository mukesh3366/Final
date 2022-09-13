provider "aws" {
    region = "ap-south-1" 
    access_key = "AKIAWAMH3D6KUKGCLGHC"
    secret_key = "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"
    
  }

  resource "aws_instance" "my-first-tera-server" {
    ami = "ami-076e3a557efe1aa9c"
    instance_type = "t2.micro"
    tags = {
        Name = "${local.stage_new}-server"
        count = "var.instance_count"
    }
  }
  
  resource "aws_vpc" "first-vpc" {
    cidr_block = var.vpc_cidr
    tags = {
    Name = "${local.stage_new}-production"
        }
    }
  

  resource "aws_subnet" "Subnet-1" {
    vpc_id     = aws_vpc.first-vpc.id 
    cidr_block = var.aws_subnet

  tags = {
    Name = "${local.stage_new}-subnet1"
  }
}

resource "aws_vpc" "second-vpc" {
    cidr_block = var.vpc_cidr
    tags = {
    Name = "${local.stage_new}-2"
        }
    }
  

  resource "aws_subnet" "Subnet-2" {
    vpc_id     = aws_vpc.second-vpc.id   
    cidr_block = var.aws_subnet

  tags = {
    Name = "${local.stage_new}-subnet2"
  }
}

resource "aws_iam_user" "Support" {
  count = length(var.user_names)
  name = var.user_names[count.index]
}

insert
