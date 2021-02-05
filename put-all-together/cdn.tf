resource "aws_cloudfront_distribution" "cdn_distribution" {

  origin {
    domain_name = aws_s3_bucket.bucket.bucket_regional_domain_name
    origin_id = var.origin_id
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }

  aliases = [
    var.cdn_alias]

  enabled = true
  is_ipv6_enabled = true
  default_root_object = var.default_object_path

  default_cache_behavior {
    allowed_methods = [
      "GET",
      "HEAD"]
    cached_methods = [
      "GET",
      "HEAD"]
    target_origin_id = var.origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl = 0
    default_ttl = 3600
    max_ttl = 86400
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Name = "aws_course_role"
    scope = "aws_course"
  }

  viewer_certificate {
    acm_certificate_arn = aws_acm_certificate.cdn_cert.arn
    ssl_support_method = "sni-only"
    #PAY ATTENTION use this parameter there is no separate pricing for this feature.
    #If you will use vip instead of sni-only you will pay 600USD pre months!!!!
  }

  depends_on = [
    aws_cloudfront_origin_access_identity.origin_access_identity]
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions = [
      "s3:GetObject"]
    resources = [
      "${aws_s3_bucket.bucket.arn}/*"]

    principals {
      type = "AWS"
      identifiers = [
        aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "example" {
  bucket = aws_s3_bucket.bucket.bucket
  policy = data.aws_iam_policy_document.s3_policy.json
}

resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "AWS course"
}

resource "aws_acm_certificate" "cdn_cert" {
  domain_name = var.cdn_domain
  validation_method = "DNS"
  provider = aws.aws_east
  tags = {
    Name = var.cdn_domain
    scope = "aws_course"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "aws_cdn_acm_certificate_record" {
  for_each = {
  for dvo in aws_acm_certificate.cdn_cert.domain_validation_options : dvo.domain_name => {
    name = dvo.resource_record_name
    record = dvo.resource_record_value
    type = dvo.resource_record_type
  }
  }

  allow_overwrite = true
  name = each.value.name
  records = [
    each.value.record]
  ttl = 60
  type = each.value.type
  zone_id = var.dns_zone_id
}