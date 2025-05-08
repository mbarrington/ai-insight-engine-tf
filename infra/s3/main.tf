resource "aws_s3_bucket" "pos_exports" {
  bucket        = var.bucket_name
  force_destroy = true

  tags = {
    Name = "ai-mvp-pos-exports"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.pos_exports.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.pos_exports.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

