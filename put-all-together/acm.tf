resource "aws_acm_certificate" "cert" {
  domain_name = var.domain
  validation_method = "DNS"

  tags = {
    scope = "aws_course"
  }

  lifecycle {
    create_before_destroy = true
  }
}