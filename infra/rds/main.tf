resource "aws_db_subnet_group" "default" {
  name       = "ai-mvp-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "ai-mvp-db-subnet-group"
  }
}

resource "aws_security_group" "rds" {
  name        = "ai-mvp-rds-sg"
  description = "Allow internal access to RDS"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"] # Internal access only
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ai-mvp-rds-sg"
  }
}

resource "aws_db_instance" "postgres" {
  identifier              = "ai-mvp-postgres"
  allocated_storage       = 20
  engine                  = "postgres"
  engine_version          = "15.2"
  instance_class          = var.instance_type
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.default.name
  vpc_security_group_ids  = [aws_security_group.rds.id]
  skip_final_snapshot     = true
  publicly_accessible     = false
  storage_encrypted       = true
  multi_az                = false

  tags = {
    Name = "ai-mvp-postgres"
  }
}

