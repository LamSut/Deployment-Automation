output "public_subnet" {
  value = aws_subnet.public_subnet.id
}

output "security_group" {
  value = aws_security_group.security_group.id
}

output "enable_dns_hostnames" {
  value = aws_vpc.myvpc.enable_dns_hostnames
}

output "enable_dns_support" {
  value = aws_vpc.myvpc.enable_dns_support
}
