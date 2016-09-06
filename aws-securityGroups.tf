resource "aws_security_group" "tithomas-sg-allowssh" {
  description         = "Allow SSH"
  name                = "tithomas-sg-allowssh"
  vpc_id              = "${aws_vpc.tithomas-vpc1.id}"
  tags = {
    Name              = "tithomas-sg-allowssh"
  }

  ingress {
    from_port         = "22"
    to_port           = "22"
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
  }
}