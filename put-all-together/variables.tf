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
variable "cdn_domain" {}
variable "domain" {}
variable "cdn_alias" {}
variable "alb_alias" {}

#Autoscaling
variable "instance_type" {}
variable "key_name" {}
variable "account_owner" {}