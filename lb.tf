resource "aws_lb" "application" {
  name               = "app"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb.id]
  subnets            = [aws_subnet.public-az-a.id, aws_subnet.public-az-b.id]
  depends_on         = [aws_internet_gateway.igw]
}

resource "aws_lb_target_group" "application" {
  name     = "app"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc.id
}

resource "aws_lb_listener" "front-end" {
  load_balancer_arn = aws_lb.application.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.application.arn
  }
}