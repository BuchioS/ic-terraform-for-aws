resource "aws_rds_cluster" "aurora-clstr" {
  cluster_identifier  = "aurora-cluster"
  database_name       = "mydb"
  master_username     = "admin"
  master_password     = "1234Admin5678"
  port                = 3306
  apply_immediately   = false
  skip_final_snapshot = true

  engine              = "aurora-mysql"
  engine_version      = "5.7.mysql_aurora.2.04.4"

  vpc_security_group_ids          = ["${aws_security_group.rds-sg.id}"]
  db_subnet_group_name            = "${aws_db_subnet_group.db-subgrp.name}"
  db_cluster_parameter_group_name = "${aws_rds_cluster_parameter_group.db-clstr-pmtgrp.name}"

  tags = {
    Name = "aurora-cluster"
  }
}

resource "aws_rds_cluster_instance" "aurora-clstr_inst" {
  count              = 2
  identifier         = "aurora-cluster-${count.index}"
  cluster_identifier = "${aws_rds_cluster.aurora-clstr.id}"
  instance_class     = "db.t2.small"
  apply_immediately  = false

  engine             = "aurora-mysql"
  engine_version     = "5.7.mysql_aurora.2.04.4"

  db_subnet_group_name    = "${aws_db_subnet_group.db-subgrp.name}"
  db_parameter_group_name = "${aws_db_parameter_group.db-pmtgrp.name}"

  tags = {
    Name = "aurora-instance"
  }
}

output "rds-entpoint" {
  value = "${aws_rds_cluster.aurora-clstr.endpoint}"
}

output "rds-entpoint-ro" {
  value = "${aws_rds_cluster.aurora-clstr.reader_endpoint}"
}
