terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_s3_bucket" "demo" {
  bucket = "${var.s3_bucket_name}"
  acl    = "private"

  tags = {
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "demo1" {
  bucket = "another-test-bucket-8445"
  acl    = "private"

  tags = {
    Environment = "Dev"
  }
}
