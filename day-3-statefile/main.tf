resource "aws_instance" "dev" {
  ami = "ami-01816d07b1128cd2d"
  instance_type = "t2.medium"
  key_name = "dns"
  subnet_id = "subnet-0275ce39fea9fc08a"
  associate_public_ip_address = true
  tags = {
    Name = "test"
  }
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "tterraform-state-lock-dynamodb"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}