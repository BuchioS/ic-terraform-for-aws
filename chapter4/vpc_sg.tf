#rds-sg
resource "aws_security_group" "rds-sg" {
  name   = "rds-sg"
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "rds-sg"
  }
}

resource "aws_security_group_rule" "egress-rds-sg" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.rds-sg.id
}

resource "aws_security_group_rule" "ingress-rds-3306" {
  type              = "ingress"
  from_port         = "3306"
  to_port           = "3306"
  protocol          = "tcp"
  cidr_blocks       = ["10.0.2.0/24"]
  security_group_id = aws_security_group.rds-sg.id
}
