#RDS Subnet AZ-1a
resource "aws_subnet" "dbsub-a" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "db-subnet-1a"
  }
}

#RDS Subnet AZ-1c
resource "aws_subnet" "dbsub-c" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "db-subnet-1c"
  }
}
