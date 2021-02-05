resource "aws_route53_record" "dns_balancer_mounting" {
  zone_id = var.dns_zone_id
  allow_overwrite = true
  name = var.domain

  type = "A"
  alias {
    name = aws_lb.aws_course_alb.dns_name
    zone_id = aws_lb.aws_course_alb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "dns_cdn_mounting" {
  zone_id = var.dns_zone_id
  allow_overwrite = true
  name = var.cdn_alias

  type = "A"
  alias {
    name = aws_cloudfront_distribution.cdn_distribution.domain_name
    zone_id = aws_cloudfront_distribution.cdn_distribution.hosted_zone_id
    evaluate_target_health = true
  }
}