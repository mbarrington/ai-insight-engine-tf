resource "aws_security_group" "ec2" {
  name        = "ai-mvp-ec2-sg"
  description = "Allow SSH and HTTP access"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ai-mvp-ec2-sg"
  }
}

resource "aws_instance" "app" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = element(var.subnet_ids, 0)
  vpc_security_group_ids = [aws_security_group.ec2.id]
  key_name               = var.key_name

  tags = {
    Name = "ai-mvp-app"
  }
}
iam_instance_profile = var.instance_profile_name
