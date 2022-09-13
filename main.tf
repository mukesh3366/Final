provider "aws" {
    region = "ap-south-1"
    access_key = "AKIAWAMH3D6KUKGCLGHC"
    secret_key = "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"
  }

  resource "aws_instance" "my-first-tera-server" {
    ami = "ami-076e3a557efe1aa9c"
    instance_type = "var.instance_type"
    tags = {
        Name = "{local.production_env}-ubuntu"
    }
  }

   locals {
     production_env = "aftermath"
   }
  
  resource "aws_vpc" "first-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
    Name = "{local.production_env}-1st-vpc"  
        }
    }
  

  resource "aws_subnet" "Subnet-1" {
    vpc_id     = aws_vpc.first-vpc.id 
    cidr_block = "10.0.1.0/24"

  tags = {
    Name = "{local.production_env}-subnet"
  }
}

resource "aws_vpc" "second-vpc" {
    cidr_block = "10.1.0.0/16"
    tags = {
    Name = "{local.production_env}-second-vpc"
        }
    }


  resource "aws_subnet" "Subnet-2" {
    vpc_id     = aws_vpc.second-vpc.id   
    cidr_block = "10.1.1.0/24"

  tags = {
    Name = "{local.production_env}-subnet"
  }
}
