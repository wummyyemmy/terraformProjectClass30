provider "aws" {
  region = var.region
}

resource "random_integer" "bucket_suffix" {
  min = 1000
  max = 9999
}

resource "aws_kms_key" "s3_bucket_key" {
  description = var.kms_key_description
}

resource "aws_s3_bucket" "s3_backend_bucket" {
  bucket = "bootcamp30-${random_integer.bucket_suffix.result}-${var.name_suffix}"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.s3_bucket_key.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}
