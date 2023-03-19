
variable "name_suffix" {
  default = "yourName"
}

variable "region" {
  default = "us-east-2"
}

variable "kms_key_description" {
  default = "KMS key for S3 bucket encryption"
}

variable "bucket_key" {
  default = "mybucketkey"
}

variable "s3_backend_bucket" {
  default = "mybuckettag"
}
