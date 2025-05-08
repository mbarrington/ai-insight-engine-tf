variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "db_name" {
  description = "Database name"
  type        = string
  default     = "aimvp"
}

variable "db_username" {
  description = "Master username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Master password"
  type        = string
  sensitive   = true
}

variable "instance_type" {
  description = "RDS instance type"
  type        = string
  default     = "db.t3.micro"
}

