
// dns
/*
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
*/

// dns
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