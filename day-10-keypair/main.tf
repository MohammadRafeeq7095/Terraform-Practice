resource "aws_key_pair" "name" {
    key_name = "dns-1"
    public_key = file("~/.ssh/id_ed25519.pub") #here you need to define public key file path
}

data "aws_subnet" "selected" {
  filter {
    name   = "tag:Name"
    values = ["pub-1a"] # insert value here
  }
}

resource "aws_instance" "dev" {
  ami                    = "ami-0440d3b780d96b29d"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.name.key_name
  subnet_id = data.aws_subnet.selected.id
  tags = {
    Name="dns-1"
  }
}