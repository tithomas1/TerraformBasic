variable "region" {
  description     = "AWS region to use"
  default         = "eu-west-1"
}

variable "vpc_cidr" {
  description     = "CIDR address block for VPC"
  default         = "10.99.1.0/24"
}

variable "public_subnet_cidr" {
  description     = "CIDR for public subnet within VPC"
  default         = "10.99.1.0/28"
}

variable "ami_list" {
  description     = "Per-region AMIs to use"
  type            = "map"
  default = {
    eu-west-1     = "ami-6ced7f1f"
  }
}