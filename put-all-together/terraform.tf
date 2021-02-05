provider "aws" {
  region = "us-east-1"
  alias = "aws_east"
}

provider "aws" {}

data "aws_vpc" "vpc" {
  default = "true"
}
data "aws_subnet_ids" "subnetId" {
  vpc_id = data.aws_vpc.vpc.id
}

data "template_file" "policy" {
  template = file("public_policy.json")
  vars = {
    bucket_name = var.bucket_name
  }
}