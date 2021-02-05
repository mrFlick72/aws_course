provider "aws" {}

data "template_file" "policy" {
  template = file("public_policy.json")
  vars = {
    bucket_name = var.bucket_name
  }
}