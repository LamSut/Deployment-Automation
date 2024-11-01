output "ami" {
  value = aws_instance.server.ami
}

output "instance_type" {
  value = aws_instance.server.instance_type
}
