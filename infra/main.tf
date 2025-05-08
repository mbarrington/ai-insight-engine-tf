terraform {
  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./vpc"
}

module "ec2" {
  source     = "./ec2"
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_ids
  key_name   = var.ec2_key_name
  instance_profile_name = module.iam.instance_profile_name

}

module "rds" {
  source     = "./rds"
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids
  db_password = var.db_password
}

module "s3" {
  source = "./s3"
}

module "iam" {
  source = "./iam"
}

module "cloudwatch" {
  source = "./cloudwatch"
}

