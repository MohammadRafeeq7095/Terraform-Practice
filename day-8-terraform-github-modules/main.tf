# This code is copyed from terraform registory and in source variable terraform github link is there this is for ec2 create

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = "t2.micro"
  key_name               = "dns"
  monitoring             = true
  vpc_security_group_ids = ["sg-0f65937d4832f9b58"]
  subnet_id              = "subnet-0275ce39fea9fc08a"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}