resource "aws_instance" "devlake_instance" {
  ami             = "ami-0f2ce9ce760bd7133"  
  instance_type   = "t2.micro"
  subnet_id       = aws_subnet.public_a.id
  vpc_security_group_ids = [aws_security_group.devlake_sg.id]  
  key_name               = "devlake-key"
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras enable docker
              yum install -y docker
              systemctl start docker
              systemctl enable docker
              docker run -d -p 3000:3000 --name devlake --restart always \
                -e DB_URL="postgres://${aws_db_instance.devlake_db.username}:${aws_db_instance.devlake_db.password}@${aws_db_instance.devlake_db.address}:5432/devlake" \
                merico/devlake
              EOF
  tags = {
    Name = "DevLake-Instance"
  }
}
