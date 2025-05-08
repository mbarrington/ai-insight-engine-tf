output "ec2_role_name" {
  description = "The name of the IAM role for EC2"
  value       = aws_iam_role.ec2_role.name
}

output "instance_profile_name" {
  description = "The name of the EC2 instance profile"
  value       = aws_iam_instance_profile.ec2_profile.name
}

