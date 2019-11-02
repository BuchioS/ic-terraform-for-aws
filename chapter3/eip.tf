resource "aws_eip" "ec2-web" {
  instance = "${aws_instance.web.id}"
  vpc = true
}
