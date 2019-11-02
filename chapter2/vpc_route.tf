resource "aws_route_table" "public-a" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    gateway_id = "${aws_internet_gateway.igw.id}"
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "rtb-pub"
  }
}

resource "aws_route_table_association" "public-a" {
  subnet_id      = "${aws_subnet.public-a.id}"
  route_table_id = "${aws_route_table.public-a.id}"
}

resource "aws_route_table" "private-a" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    nat_gateway_id = "${aws_nat_gateway.ngw.id}"
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "rtb-priv"
  }
}

resource "aws_route_table_association" "private-a" {
  subnet_id      = "${aws_subnet.private-a.id}"
  route_table_id = "${aws_route_table.private-a.id}"
}
