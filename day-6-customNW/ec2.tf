resource "aws_instance" "public-server" {
  ami = var.amiid
  key_name = "dns"
  subnet_id = aws_subnet.public-subnet.id
  instance_type = var.type
  associate_public_ip_address = true

  # Attach the security group
  vpc_security_group_ids = [aws_security_group.custom-sg.id]
  
  tags = {
    Name = "public-server"
  }
}


resource "aws_instance" "private-server" {
  ami = var.amiid
  key_name = "dns"
  subnet_id = aws_subnet.Private-subnet.id
  instance_type = var.type
  associate_public_ip_address = false

  # Attach the security group
  vpc_security_group_ids = [aws_security_group.custom-sg.id]

  tags = {
    Name = "private-server"
  }
}