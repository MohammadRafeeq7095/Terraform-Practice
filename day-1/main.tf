resource "aws_instance" "name" {
  ami = "ami-01816d07b1128cd2d"
  instance_type = "t2.micro"
  key_name = "dns"
  subnet_id = "subnet-0275ce39fea9fc08a"
}