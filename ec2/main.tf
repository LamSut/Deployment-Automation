resource "aws_instance" "server" {
  ami             = "ami-06b21ccaeff8cd686"
  instance_type   = "t2.micro"
  subnet_id       = var.subnet
  security_groups = [var.security_group]

  tags = {
    Name = "myserver"
  }
}
