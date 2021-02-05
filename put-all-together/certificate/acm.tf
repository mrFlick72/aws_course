provider "aws" {
  region = "us-east-1"
}

resource "aws_acm_certificate" "cert" {
  domain_name = var.domain
  validation_method = "DNS"

  subject_alternative_names = [var.subject_alternative_name]

  tags = {
    Name = var.domain
    scope = "aws_course"
  }

  lifecycle {
    create_before_destroy = true
  }
}