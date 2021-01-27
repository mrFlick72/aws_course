provider "aws" {}

resource "aws_security_group" "autoscaling_hello_world_sg" {
  name = "autoscaling_hello_world_sg"

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"]
    from_port = 8080
    protocol = "TCP"
    to_port = 8080
  }

  tags = {
    scope = "aws_course"
  }
}

resource "aws_instance" "aws_course_ec2_instance" {
  depends_on = [
    aws_security_group.autoscaling_hello_world_sg]
  ami = var.ami
  instance_type = var.instance_type
  iam_instance_profile = "aws_course_role"
  associate_public_ip_address = true
  key_name = var.key_name
  subnet_id = var.subnet_id

  vpc_security_group_ids = [
    aws_security_group.autoscaling_hello_world_sg.id
  ]

  tags = {
    "Name":"Autoscaling Hello World"
    scope = "aws_course"
  }

}
