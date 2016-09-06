provider "aws" {
  region			= "${var.region}"
}

resource "aws_vpc" "tithomas-vpc1" {
  cidr_block        = "${var.vpc_cidr}"
  tags {
    Name            = "tithomas-vpc1"
  }
}