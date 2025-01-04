terraform {
  backend "s3" {
    bucket = "terraformtfstatesbucket"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}