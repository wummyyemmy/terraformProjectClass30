# This creates an s3 bucket with encryption
provider "aws" {

    access_key = "${var.AWS_KEY_ID}"

    secret_key = "${var.AWS_SECRET}"

    region = "${var.region}"

}

resource "aws_s3_bucket" "bootcamp30-15032023-akinwumi" {

    bucket = "${var.bucket_name}" 

    acl = "${var.acl_value}"   

}
resource "aws_kms_key" "mykey" {
    deletion_window_in_days = 10
}

resource "aws_s3_bucket_server_side_encryption_configuration" "myencription" {
    bucket = aws_s3_bucket.bootcamp30-15032023-akinwumi.bucket  
    rule {
            apply_server_side_encryption_by_default {
                kms_master_key_id = aws_kms_key.mykey.arn
                sse_algorithm = "aws:kms"
            }
    }
}           
