resource "aws_db_subnet_group" "default" {
  name       = "db-group"
  subnet_ids = [aws_subnet.db-az-a.id, aws_subnet.db-az-b.id, aws_subnet.db-az-c.id]
}

resource "aws_rds_cluster" "application-db" {
  cluster_identifier        = "app-db-cluster"
  db_subnet_group_name      = aws_db_subnet_group.default.name
  availability_zones        = ["eu-south-1a", "eu-south-1b", "eu-south-1c"]
  engine                    = "mysql"
  engine_version            = "8.0.35"
  db_cluster_instance_class = "db.m5d.large"
  storage_type              = "io1"
  allocated_storage         = 100
  iops                      = 1000
  master_username           = "dbadmin"
  master_password           = "vVCwfS3bpe"
  skip_final_snapshot       = true
  vpc_security_group_ids    = [aws_security_group.rds.id]
}