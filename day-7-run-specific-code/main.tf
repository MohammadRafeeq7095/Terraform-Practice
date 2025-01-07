resource "aws_instance" "test" {
  ami = "ami-01816d07b1128cd2d"
  instance_type = "t2.medium"
  key_name = "dns"
  subnet_id = "subnet-0275ce39fea9fc08a"
  associate_public_ip_address = true
    
  tags = {
    Name = "test"
  }

}

# code to create s3 bucket
resource "aws_s3_bucket" "lambda_bucket" {
  bucket        = "my-lambda-bucket-unique-name-abcd"

  tags = {
    Name = "LambdaBucket"
  }
}

# command: terraform plan -target=aws_s3_bucket.lambda_bucket
# run the above command in terminal for debug(execute) or destroy or plan the specific resource