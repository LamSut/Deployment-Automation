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

//for unit testing vpc

output "enable_dns_hostnames" {
  value = aws_vpc.my_vpc.enable_dns_hostnames
}

output "enable_dns_support" {
  value = aws_vpc.my_vpc.enable_dns_support
}

// for unit testing subnets

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

// for integration testing

//vpc id
output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

//gateway id
output "gw" {
  value = aws_internet_gateway.my_vpc_igw.id
}

//gateway attach to vpc
output "gw_vpc_id" {
  value = aws_internet_gateway.my_vpc_igw.vpc_id
}

//subnet1 vpc id
output "subnet1_vpc_id" {
  value = aws_subnet.public_subnet1.vpc_id
}

//route_table1 id
output "route_table1" {
  value = aws_route_table.public_subnet_route_table1.id
}

//route_table1 vpc id
output "route_table1_vpc_id" {
  value = aws_route_table.public_subnet_route_table1.vpc_id
}

//route_table1 gw id
output "route_table1_gw_id" {
  value = [for r in aws_route_table.public_subnet_route_table1.route : r.gateway_id]
}

//subnet1 route table association
output "association_route_table1" {
  value = aws_route_table_association.public_subnet_route_table1.route_table_id
}

output "association_subnet1" {
  value = aws_route_table_association.public_subnet_route_table1.subnet_id
}

//subnet2 vpc id
output "subnet2_vpc_id" {
  value = aws_subnet.public_subnet2.vpc_id
}

//route_table2 id
output "route_table2" {
  value = aws_route_table.public_subnet_route_table2.id
}

//route_table2 vpc id
output "route_table2_vpc_id" {
  value = aws_route_table.public_subnet_route_table2.vpc_id
}

//route_table2 gw id
output "route_table2_gw_id" {
  value = [for r in aws_route_table.public_subnet_route_table2.route : r.gateway_id]
}

//subnet2 route table association
output "association_route_table2" {
  value = aws_route_table_association.public_subnet_route_table2.route_table_id
}

output "association_subnet2" {
  value = aws_route_table_association.public_subnet_route_table2.subnet_id
}
