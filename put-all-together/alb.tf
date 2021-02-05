resource "aws_lb_target_group" "aws_course_tg" {
  name = "aws-course-tg"
  port = 8080
  protocol = "HTTP"

  vpc_id = data.aws_vpc.vpc.id

  health_check {
    protocol = "HTTP"
    path = "/index"
    unhealthy_threshold = 2
    healthy_threshold = 2
    matcher = "200"
    interval = 15
    timeout = 10
  }
  tags = {
    scope = "aws_course"
  }
}

resource "aws_lb" "aws_course_alb" {
  name = "aws-course-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [
    aws_security_group.autoscaling_hello_world_sg.id]
  subnets = toset(data.aws_subnet_ids.subnetId.ids)
  tags = {
    scope = "aws_course"
  }
}

// alb default listener
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.aws_course_alb.arn
  port = "443"
  protocol = "HTTPS"
  ssl_policy = "ELBSecurityPolicy-FS-1-2-Res-2020-10"
  certificate_arn = var.cert_arn

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.aws_course_tg.arn
  }
}