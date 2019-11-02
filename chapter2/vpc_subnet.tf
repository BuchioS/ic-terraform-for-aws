#Public Subnet
resource "aws_subnet" "public-a" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "pub-a"
  }
}

#Private Subnet
resource "aws_subnet" "private-a" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "priv-a"
  }
}
