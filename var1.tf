variable "vpc_cidr" {
  default = "10.0.0.0/16"
  type = string 
}
variable "aws_subnet" {
  default = "10.0.1.0/24"
  type = string 
}
locals {
  stage_new = "mukesh"
}   
variable "instance_count" {
  description = "ec2-instance"
  type = number
  default = 5

}
variable "user_names" {
  description = "IAM Usernames"
  type = list(string)
  default = [ "user1" ,  "user2" , "user3"]
}

