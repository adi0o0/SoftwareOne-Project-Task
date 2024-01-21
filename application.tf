resource "aws_launch_template" "web-server-template" {
  name          = "web-server"
  image_id      = "ami-0c96319db4545e18f"
  instance_type = "t3.micro"
  user_data = base64encode(templatefile("${path.module}/templates/webserver.sh", {
    efs-dns-name = aws_efs_file_system.file-system.dns_name
  }))
  vpc_security_group_ids = [aws_security_group.app.id]

  iam_instance_profile {
    name = aws_iam_instance_profile.apache.name
  }
}

resource "aws_autoscaling_group" "web-servers" {
  desired_capacity = 2
  max_size         = 2
  min_size         = 1

  # Creating EC2 instances in private subnet
  vpc_zone_identifier = [aws_subnet.app-az-a.id, aws_subnet.app-az-b.id]

  # Connect to the target group
  target_group_arns = [aws_lb_target_group.application.arn]

  launch_template {
    id      = aws_launch_template.web-server-template.id
    version = aws_launch_template.web-server-template.latest_version
  }
}