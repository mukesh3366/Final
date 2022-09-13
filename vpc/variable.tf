variable "aws_instance_type" {
  count = "50"
  type = string
  default = "t2.micro"
}

