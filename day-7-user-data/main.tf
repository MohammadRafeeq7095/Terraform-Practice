resource "aws_instance" "public-server" {
  ami = var.ami_id
  key_name = var.keyname
  subnet_id = var.subnet
  instance_type = var.type
  associate_public_ip_address = true

  # user data in server
  user_data = file("test.sh")
  
  tags = {
    Name = "test-server"
  }

}
