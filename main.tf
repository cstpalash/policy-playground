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

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "arn:aws:kms:us-west-2:611511327901:key/a98051f9-3213-4126-b438-111122246bef"
        sse_algorithm     = "aws:kms"
      }
    }
  }

  tags = {
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "demo1" {
  bucket = "another-test-bucket-8445"
  acl    = "private"
  
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "arn:aws:kms:us-west-2:611511327901:key/a98051f9-3213-4126-b438-111122246bef"
        sse_algorithm     = "aws:kms"
      }
    }
  }
}
