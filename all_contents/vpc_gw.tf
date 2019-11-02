resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = {
    Name = "igw"
  }
}


resource "aws_nat_gateway" "ngw" {
  allocation_id = "${aws_eip.ngw.id}"
  subnet_id     = "${aws_subnet.public-a.id}"

  tags = {
    Name = "ngw"
  }
}
