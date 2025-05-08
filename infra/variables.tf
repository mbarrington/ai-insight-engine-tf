# AWS region
variable "aws_region" {
  description = "The AWS region to deploy into"
  type        = string
  default     = "us-west-2"
}

# EC2 Key Pair Name
variable "ec2_key_name" {
  description = "Name of the EC2 Key Pair to enable SSH access"
  type        = string
}

# Database password
variable "db_password" {
  description = "Password for the RDS PostgreSQL admin user"
  type        = string
  sensitive   = true
}

