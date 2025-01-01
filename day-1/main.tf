resource "aws_instance" "name" {
  ami = var.ami_id
  instance_type = var.type
  key_name = var.keyname
  subnet_id = var.subnet
}