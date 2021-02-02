provider "aws" {}

data "aws_alb" "alb" {
  tags = {
    scope: "aws_course"
  }
}

data "aws_cloudfront_distribution" "cdn" {
  tags = {
    scope: "aws_course"
  }
}

// dns
resource "aws_route53_record" "dns_balancer_mounting" {
  zone_id = var.dns_zone_id
  allow_overwrite = true
  name = var.balancer_record_name

  type = "A"
  alias {
    name = data.aws_alb.alb.dns_name
    zone_id = data.aws_alb.alb.zone_id
    evaluate_target_health = true
  }
}

// dns
resource "aws_route53_record" "dns_cdn_mounting" {
  zone_id = var.dns_zone_id
  allow_overwrite = true
  name = var.cdn_record_name

  type = "A"
  alias {
    name = data.aws_cloudfront_distribution.cdn.domain_name
    zone_id = data.aws_cloudfront_distribution.cdn.hosted_zone_id
    evaluate_target_health = true
  }
}
