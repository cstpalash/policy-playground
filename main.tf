terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

variable "aws_region" {
  type = string
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "storage-test-dev"
  acl    = "private"

  versioning = {
    enabled = true
  }

  tags = {
    env = "dev"
  }

}