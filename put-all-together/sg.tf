
resource "aws_security_group" "autoscaling_hello_world_sg" {
  name = "autoscaling_hello_world_sg"

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"]
    from_port = 8080
    protocol = "TCP"
    to_port = 8080
  }

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"]
    from_port = 443
    protocol = "TCP"
    to_port = 443
  }

  egress {
    cidr_blocks = [
      "0.0.0.0/0"]
    from_port = 8080
    protocol = "TCP"
    to_port = 8080
  }
  egress {
    cidr_blocks = [
      "0.0.0.0/0"]
    from_port = 443
    protocol = "TCP"
    to_port = 443
  }

  tags = {
    scope = "aws_course"
  }
}