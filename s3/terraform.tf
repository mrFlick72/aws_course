provider "aws" {}

data "template_file" "policy" {
  template = file("public_policy.json")
  vars = {
    bucket_name = var.bucket_name
  }
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl = "public-read"


  policy = data.template_file.policy.rendered
  website {

    index_document = "index.html"
    error_document = "error.html"
  }
  tags = {
    Name = "aws_course_role"
    scope = "aws_course"
  }
}

resource "aws_s3_bucket_object" "profile" {
  bucket = aws_s3_bucket.bucket.bucket
  key = "static/images/profile.png"
  source = var.image_path
}

resource "aws_s3_bucket_object" "index" {
  bucket = aws_s3_bucket.bucket.bucket
  key = "index.html"
  source = var.default_website_index
}

resource "aws_s3_bucket_object" "error" {
  bucket = aws_s3_bucket.bucket.bucket
  key = "error.html"
  source = var.default_website_error
}