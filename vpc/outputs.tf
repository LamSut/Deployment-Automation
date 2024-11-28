//for using vpc

output "public_subnet1" {
  value = aws_subnet.public_subnet1.id
}

output "public_subnet2" {
  value = aws_subnet.public_subnet2.id
}

output "security_group" {
  value = aws_security_group.security_group.id
}

//for test vpc

output "enable_dns_hostnames" {
  value = aws_vpc.my_vpc.enable_dns_hostnames
}

output "enable_dns_support" {
  value = aws_vpc.my_vpc.enable_dns_support
}

// for test subnet

output "map_public_ip_on_launch" {
  value = aws_subnet.public_subnet1.map_public_ip_on_launch
}

output "vpc_sm" {
  value = tonumber(split("/", aws_vpc.my_vpc.cidr_block)[1])
}

output "subnet1_sm" {
  value = tonumber(split("/", aws_subnet.public_subnet1.cidr_block)[1])
}

output "subnet2_sm" {
  value = tonumber(split("/", aws_subnet.public_subnet2.cidr_block)[1])
}
