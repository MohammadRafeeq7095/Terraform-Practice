output "private_ip" {
  value = aws_instance.public-server.private_ip
}

output "public_ip" {
  value = aws_instance.public-server.public_ip
}

output "private_server_ip" {
  value = aws_instance.private-server.public_ip
}