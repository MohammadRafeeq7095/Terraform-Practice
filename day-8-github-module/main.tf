module "dev" {
  source = ""
  ami_id = "ami-01816d07b1128cd2d"
  type = "t2.micro"
  keyname = "dns"
  subnet = "subnet-0275ce39fea9fc08a"
}