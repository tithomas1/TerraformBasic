/*
 * Internet gateway for the public subnet
 */

resource "aws_internet_gateway" "tithomas-igw1" {
  vpc_id              = "${aws_vpc.tithomas-vpc1.id}"
  tags = {
    Name              = "tithomas-igw1"
  }
}

/*
 * Public subnet itself
 */

resource "aws_subnet" "tithomas-sbn-public" {
  vpc_id              = "${aws_vpc.tithomas-vpc1.id}"
  cidr_block          = "${var.public_subnet_cidr}"
  map_public_ip_on_launch = true
  depends_on          = ["aws_internet_gateway.tithomas-igw1"]
  tags = {
    Name              = "tithomas-sbn-public"
  }
}

/*
 * Routing table for the public subnet
 */

resource "aws_route_table" "tithomas-rt1" {
  vpc_id              = "${aws_vpc.tithomas-vpc1.id}"
  route {
    cidr_block        = "0.0.0.0/0"
    gateway_id        = "${aws_internet_gateway.tithomas-igw1.id}"
  }
  tags = {
    Name              = "tithomas-rt1"
  }
}

/*
 * Associate routing table to public subnet
 */

resource "aws_route_table_association" "public" {
  subnet_id           = "${aws_subnet.tithomas-sbn-public.id}"
  route_table_id      = "${aws_route_table.tithomas-rt1.id}"
}