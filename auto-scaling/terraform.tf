provider "aws" {}

data aws_ami "ami" {
  owners = [
    var.account_owner]

  filter {
    name = "tag:Name"
    values = [
      "Autoscaling Hello World"]
  }

  filter {
    name = "tag:scope"
    values = [
      "aws_course"]
  }

  filter {
    name = "tag:version"
    values = [
      "v1.0.0"]
  }
}


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

data aws_lb_target_group "alb_tg" {
  tags = {
    scope: "aws_course"
  }
}
resource "aws_launch_template" "aws_course_launch_template" {
  name = "aws_course_launch_template"

  iam_instance_profile {
    name = "aws_course_role"
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      "Name":"Autoscaling Hello World"
      scope = "aws_course"
    }
  }
  tags = {
    "Name":"Autoscaling Hello World Launch Template"
    scope = "aws_course"
  }

  image_id = data.aws_ami.ami.id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [
    data.aws_security_group.sg.id]

}

resource "aws_autoscaling_group" "aws_course_autoscaling_group" {
  name = "aws_course_autoscaling_group"
  max_size = 5
  min_size = 2
  health_check_grace_period = 300
  health_check_type = "ELB"
  desired_capacity = 3
  force_delete = true

  launch_template {
    id = aws_launch_template.aws_course_launch_template.id
    version = "$Latest"
  }

  target_group_arns = [
    data.aws_lb_target_group.alb_tg.arn
  ]

  vpc_zone_identifier = toset(data.aws_subnet_ids.subnetId.ids)

}