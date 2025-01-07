# Create VPC
resource "aws_vpc" "VPC" {
  cidr_block = var.vpc-cidr_block
  tags = {
    Name = "custom-vpc"
  }
}

# Create Public Subnets
resource "aws_subnet" "public-subnet" {
  vpc_id = aws_vpc.VPC.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "Public-Subnet"
  }
}

# Create Private Subnets
resource "aws_subnet" "Private-subnet" {
  vpc_id = aws_vpc.VPC.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "Private-Subnet"
  }
}

# Create IG
resource "aws_internet_gateway" "IG" {
  vpc_id = aws_vpc.VPC.id
  tags = {
    Name = "Custom-IG"
  }
}

# Create Public Route Table
resource "aws_route_table" "Public-RT" {
  vpc_id = aws_vpc.VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IG.id
  }
  tags = {
    Name = "Public-RT"
  }
}

# Subnet accossiation
resource "aws_route_table_association" "RT-Subnet" {
  route_table_id = aws_route_table.Public-RT.id
  subnet_id = aws_subnet.public-subnet.id
}

# allocate elastic ip address for nat gateway
resource "aws_eip" "eip" {

  tags = {
    Name = "example-eip"
  }
}

# Create Nat gateway
resource "aws_nat_gateway" "nat" {
  subnet_id = aws_subnet.public-subnet.id
  allocation_id = aws_eip.eip.id
  tags = {
    Name = "nat-gateway"
  }
}

# Create Private Route Table and Nat gateway to route table
resource "aws_route_table" "Private-RT" {
  vpc_id = aws_vpc.VPC.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = "Private-RT"
  }
}


# Associate the route table with the private subnet
resource "aws_route_table_association" "PrivateRT-PrivateSubnet" {
  subnet_id      = aws_subnet.Private-subnet.id
  route_table_id = aws_route_table.Private-RT.id
}


# Security Group
resource "aws_security_group" "custom-sg" {
  name        = "allow_tls"
  vpc_id      = aws_vpc.VPC.id
  tags = {
    Name = "Custom-SG"
  }
 ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }
ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

}