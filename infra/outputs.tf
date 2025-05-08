output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.vpc.public_subnet_ids
}

output "ec2_instance_id" {
  description = "The EC2 instance ID"
  value       = module.ec2.instance_id
}


output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.ec2.public_ip
}

output "ec2_instance_role" {
  description = "IAM role name for EC2"
  value       = module.iam.ec2_role_name
}

output "ec2_instance_profile" {
  description = "IAM instance profile name for EC2"
  value       = module.iam.instance_profile_name
}


output "rds_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = module.rds.endpoint
}


output "rds_identifier" {
  description = "The RDS instance ID"
  value       = module.rds.db_identifier
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket used for POS exports"
  value       = module.s3.bucket_name
}

output "cloudwatch_log_group" {
  description = "CloudWatch log group for EC2 instance"
  value       = module.cloudwatch.log_group_name
}

