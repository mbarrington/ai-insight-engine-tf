resource "aws_cloudwatch_log_group" "ec2" {
  name              = "/ai-mvp/ec2"
  retention_in_days = var.retention_days

  tags = {
    Name = "ai-mvp-ec2-logs"
  }
}

