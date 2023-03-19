#This creates an s3 bucket with encryption

rovider "aws" {
  region = var.region
}

resource "random_integer" "bucket_suffix" {
  min = 1000
  max = 9999
}

resource "aws_kms_key" "${var.bucket_key}" {
  description = var.kms_key_description
  deletion_window_in_days = 10
}

resource "aws_s3_bucket" "${var.s3_backend_bucket}" {
  bucket = "bootcamp30-${random_integer.bucket_suffix.result}-${var.name_suffix}"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.${var.bucket_key}.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}
