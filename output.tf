output "instance_public_ip" {
  value = aws_instance.devlake_instance.public_ip
}

output "db_endpoint" {
  value = aws_db_instance.devlake_db.endpoint
}
