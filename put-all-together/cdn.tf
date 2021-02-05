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
    acm_certificate_arn = var.cert_arn
    ssl_support_method = "sni-only"
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