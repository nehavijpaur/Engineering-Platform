resource "aws_db_instance" "devlake_db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "17.2"
  instance_class       = "db.t3.micro"
  db_name              = "devlake1_db"
  username             = "devadmin"
  password             = "Devlake2025!"
  db_subnet_group_name = aws_db_subnet_group.devLake_subnet.id
  multi_az             = false
  publicly_accessible  = true
  backup_retention_period = 7
  tags = {
    Name = "DevLake-DB"
  }
}

resource "aws_db_subnet_group" "devLake_subnet" {
  name        = "devlake-subnet-group"
  subnet_ids  = [
    aws_subnet.public_a.id,  # AZ 1 subnet
    aws_subnet.public_b.id   # AZ 2 subnet
  ]
  tags = {
    Name = "DevLake-Subnet-Group"
  }
}

