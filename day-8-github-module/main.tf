# Source from github repo copy the link and past in source variable like below

module "dev" {
  source = "github.com/MohammadRafeeq7095/Terraform-Practice/day-8-module-ec2-template"
  ami_id = "ami-01816d07b1128cd2d"
  type = "t2.micro"
  keyname = "dns"
  subnet = "subnet-0275ce39fea9fc08a"
}