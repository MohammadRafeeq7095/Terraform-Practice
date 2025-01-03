resource "aws_instance" "dev" {
  ami = var.amiid
  instance_type = var.type
  key_name = var.keyname
  subnet_id = var.subnet_id
  associate_public_ip_address = true
}