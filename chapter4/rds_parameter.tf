resource "aws_db_parameter_group" "db-pmtgrp" {
  name   = "db-pmtgrp"
  family = "aurora-mysql5.7"
  description = "RDS parameter group"
}

resource "aws_rds_cluster_parameter_group" "db-clstr-pmtgrp" {
  name        = "db-clstr-pmtgrp"
  family      = "aurora-mysql5.7"
  description = "RDS cluster parameter group"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }

  parameter {
    name         = "time_zone"
    value        = "Asia/Tokyo"
    apply_method = "immediate"
  }
}
