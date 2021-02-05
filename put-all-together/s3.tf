resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl = "public-read"


  policy = data.template_file.policy.rendered
  website {

    index_document = "index.html"
    error_document = "error.html"
  }

  cors_rule {
    allowed_methods = [
      "GET", "PUT", "POST", "DELETE", "HEAD"]
    allowed_headers = [
      "*"]
    allowed_origins = [
      "*"
    ]
    expose_headers = [
      "ETag"]
    max_age_seconds = 3000
  }

  tags = {
    Name = "aws_course_role"
    scope = "aws_course"
  }
}

resource "aws_s3_bucket_object" "profile" {
  bucket = aws_s3_bucket.bucket.bucket
  key = "image/profile.png"
  source = var.image_path

  content_type = "image/png"
}

resource "aws_s3_bucket_object" "index" {
  bucket = aws_s3_bucket.bucket.bucket
  key = "index.html"
  source = var.default_website_index

  content_type = "text/html"
}

resource "aws_s3_bucket_object" "error" {
  bucket = aws_s3_bucket.bucket.bucket
  key = "error.html"
  source = var.default_website_error

  content_type = "text/html"
}