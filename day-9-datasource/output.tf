output "private_ip" {
  value = aws_instance.dev.private_ip
}

output "public_ip" {
  value = aws_instance.dev.public_ip
}

output "ami_id" {
  value = aws_instance.dev.ami
}

output "selected" {
  value = data.aws_subnet.selected.id
}