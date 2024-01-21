resource "aws_efs_file_system" "file-system" {
  creation_token   = "efs"
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"
}

resource "aws_efs_mount_target" "az-a" {
  file_system_id  = aws_efs_file_system.file-system.id
  subnet_id       = aws_subnet.app-az-a.id
  security_groups = [aws_security_group.app.id]
}

resource "aws_efs_mount_target" "az-b" {
  file_system_id  = aws_efs_file_system.file-system.id
  subnet_id       = aws_subnet.app-az-b.id
  security_groups = [aws_security_group.app.id]
}