provider "aws" {}

resource "aws_s3_bucket" "bucket_name" {
  bucket = var.bucket_name
  acl = "private"

  tags = {
    Name = "aws_course_role"
    scope = "aws_course"
  }
}

resource "aws_s3_bucket_object" "profile" {
  bucket = aws_s3_bucket.bucket_name.bucket
  key = "static/images/profile.png"
  source = var.object_path
}
