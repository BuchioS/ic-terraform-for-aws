resource "aws_eip" "ngw" {
  vpc = true
}

resource "aws_eip" "ec2-web" {
  instance = "${aws_instance.web.id}"
  vpc = true
}
