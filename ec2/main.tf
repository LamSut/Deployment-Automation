resource "aws_instance" "server_1" {
  ami             = "ami-06b21ccaeff8cd686"
  instance_type   = "t2.micro"
  subnet_id       = var.subnet
  security_groups = [var.security_group]

  tags = {
    Name = "B2111933 Amazon Linux"
  }
}

resource "aws_instance" "server_2" {
  ami             = "ami-0866a3c8686eaeeba"
  instance_type   = "t2.micro"
  subnet_id       = var.subnet
  security_groups = [var.security_group]

  tags = {
    Name = "B2111933 Ubuntu"
  }
}

resource "aws_instance" "server_3" {
  ami             = "ami-0324a83b82023f0b3"
  instance_type   = "t2.micro"
  subnet_id       = var.subnet
  security_groups = [var.security_group]

  tags = {
    Name = "B2111933 Windows"
  }
}
