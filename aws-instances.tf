resource "aws_instance" "tithomas-test" {
  ami                 = "${lookup(var.ami_list, var.region)}"
  instance_type       = "t2.micro"
  subnet_id           = "${aws_subnet.tithomas-sbn-public.id}"
  security_groups     = ["${aws_security_group.tithomas-sg-allowssh.id}"]
  key_name            = "tithomas-euwest-kp1"
  tags {
    Name              = "tithomas-tf-test"
  }
}