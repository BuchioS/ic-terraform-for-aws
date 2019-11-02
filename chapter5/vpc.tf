resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  enable_dns_support = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "dev-vpc"
  }
}

#Internal
resource "aws_vpc" "int" {
  cidr_block = "11.0.0.0/16"

  enable_dns_support = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "internal-vpc"
  }
}
