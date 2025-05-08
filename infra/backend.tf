terraform {
  backend "s3" {
    bucket         = "my-terraform-state-mvp"    # change to your bucket name
    key            = "infra/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-locks"           # optional but recommended
    encrypt        = true
  }
}

