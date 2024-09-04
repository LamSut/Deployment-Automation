#ec2

resource "aws_instance" "server" {
  ami = "ami-066784287e358dad1"
  instance_type = "t2.micro"
  subnet_id = var.subnet
  security_groups = [var.security_group]

  tags = {
    Name = "myserver"
  }
}