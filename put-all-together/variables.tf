#S3
variable "bucket_name" {}
variable "image_path" {}
variable "default_website_index" {}
variable "default_website_error" {}

# CloudFront
variable "default_object_path" {}
variable "origin_id" {}

#Route53
variable "dns_zone_id" {}
variable "domain" {}
variable "cdn_alias" {}
variable "alb_alias" {}