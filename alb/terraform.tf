provider "aws" {}

// get balancer instance data
data "aws_instances" "instances" {
  instance_tags = {
    scope = "aws_course"
  }
}

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


// attach instances to alb target group
resource "aws_lb_target_group_attachment" "instances_tg" {
  for_each = toset(data.aws_instances.instances.ids)

  target_group_arn = aws_lb_target_group.aws_course_tg.arn
  target_id = each.value
  port = 8080
}

////////////////////// define ALB
data "aws_vpc" "vpc" {
  default = "true"
}
data "aws_subnet_ids" "subnetId" {
  vpc_id = data.aws_vpc.vpc.id
}

data "aws_security_group" "sg" {
  tags = {
    scope:"aws_course"
  }
}

resource "aws_lb" "aws_course_alb" {
  name = "aws-course-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [
    data.aws_security_group.sg.id]
  subnets = toset(data.aws_subnet_ids.subnetId.ids)
  tags = {
    scope = "aws_course"
  }
}

// alb default listener
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.aws_course_alb.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.aws_course_tg.arn
  }
}