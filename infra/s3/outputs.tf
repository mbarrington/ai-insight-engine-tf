output "bucket_name" {
  description = "Name of the POS exports S3 bucket"
  value       = aws_s3_bucket.pos_exports.bucket
}

