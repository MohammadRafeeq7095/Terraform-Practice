resource "aws_key_pair" "name" {
    key_name = "testpublic"
    public_key = file("~/.ssh/id_ed25519.pub") #here you need to define public key file path
}
resource "aws_instance" "example" {
  ami           =  data.aws_ami.amzlinux.id# Amazon Linux 2 AMI
  instance_type = "t2.micro"
  subnet_id = data.aws_subnet.selected.id
  associate_public_ip_address = true

  key_name = aws_key_pair.name.key_name

  tags = {
    Name = "remote-local"
  }
 
  # User data for basic web server setup
  provisioner "remote-exec" {
    inline = [
      # Wait until yum is free
      "while sudo fuser /var/run/yum.pid >/dev/null 2>&1; do echo 'Waiting for yum...'; sleep 5; done",
      
      # Update and install necessary packages
      "sudo yum update -y",
      "sudo yum install -y httpd git",

      # Start and enable Apache HTTP server
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",

      # Ensure /var/www/html directory exists
      "sudo mkdir -p /var/www/html",

      # Write to the file
      "echo 'Git installed successfully!' | sudo tee /var/www/html/git_installed.txt"
    ]

    # Connection block
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/id_ed25519") # Path to your private key
      host        = self.public_ip
    }
  }
  # Local-exec provisioner
  provisioner "local-exec" {
    command = "echo Instance created with IP: ${self.public_ip} >> instance_ips.txt"
  }

}