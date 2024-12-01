//vpc
resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    "Name" = "my_vpc"
  }
}

//vpc gw
resource "aws_internet_gateway" "my_vpc_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "vpc_igw"
  }
}

//subnet 1
resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnet1_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone

  tags = {
    "Name" = "public_subnet1"
  }
}

resource "aws_route_table" "public_subnet_route_table1" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = var.default_cidr
    gateway_id = aws_internet_gateway.my_vpc_igw.id
  }

  tags = {
    Name = "public_subnet_route_table1"
  }
}

resource "aws_route_table_association" "public_subnet_route_table1" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_subnet_route_table1.id
}

//subnet2
resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnet2_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone

  tags = {
    "Name" = "public_subnet2"
  }
}

resource "aws_route_table" "public_subnet_route_table2" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = var.default_cidr
    gateway_id = aws_internet_gateway.my_vpc_igw.id
  }

  tags = {
    Name = "public_subnet_route_table2"
  }
}

resource "aws_route_table_association" "public_subnet_route_table2" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_subnet_route_table2.id
}

//security group
resource "aws_security_group" "security_group" {
  vpc_id      = aws_vpc.my_vpc.id
  name        = "my_security_group"
  description = "Public Security Group"

  ingress { //for HTTP
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.default_cidr]
  }

  ingress { //for SSH
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.default_cidr]
  }

  ingress { //for Windows Remote Connection
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = [var.default_cidr]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.default_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.default_cidr]
  }
}
