provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "secure_logs" {
  bucket = "amaury-demo-secure-logs-123456"
}

resource "aws_s3_bucket_versioning" "secure_logs_versioning" {
  bucket = aws_s3_bucket.secure_logs.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "secure_logs_encryption" {
  bucket = aws_s3_bucket.secure_logs.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "secure_logs_block" {
  bucket = aws_s3_bucket.secure_logs.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}