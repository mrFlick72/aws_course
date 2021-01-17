provider "aws" {}
data "aws_s3_bucket" "origin" {
  bucket = var.bucket_name
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = data.aws_s3_bucket.origin.bucket_regional_domain_name
    origin_id = var.origin_id
  }

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
    cloudfront_default_certificate = true
  }
}