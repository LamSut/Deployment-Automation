#ec2

resource "aws_instance" "server" {
  ami = "ami-066784287e358dad1"
  instance_type = "t2.micro"
  subnet_id = var.security_group
  security_groups = var.subnet

  tags = {
    Name = "myserver"
  }
}