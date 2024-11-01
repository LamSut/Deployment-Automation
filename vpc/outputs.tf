output "public_subnet" {
  value = aws_subnet.public_subnet.id
}

output "security_group" {
  value = aws_security_group.security_group.id
}
