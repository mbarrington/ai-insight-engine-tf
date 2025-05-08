output "endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.postgres.endpoint
}

output "db_identifier" {
  description = "RDS instance identifier"
  value       = aws_db_instance.postgres.id
}

