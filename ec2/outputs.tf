//for unit testing

output "ami_amazon" {
  value = aws_instance.amazon[*].ami
}

output "instance_type_amazon" {
  value = aws_instance.amazon[*].instance_type
}

output "ami_ubuntu" {
  value = aws_instance.ubuntu[*].ami
}

output "instance_type_ubuntu" {
  value = aws_instance.ubuntu[*].instance_type
}

output "ami_windows" {
  value = aws_instance.windows[*].ami
}

output "instance_type_windows" {
  value = aws_instance.windows[*].instance_type
}

//for integration testing

//amazon network
output "subnet_amazon" {
  value = aws_instance.amazon[*].subnet_id
}

output "sg_amazon" {
  value = aws_instance.amazon[*].vpc_security_group_ids
}

//ubuntu network
output "subnet_ubuntu" {
  value = aws_instance.ubuntu[*].subnet_id
}

output "sg_ubuntu" {
  value = aws_instance.ubuntu[*].vpc_security_group_ids
}

//amazon network
output "subnet_windows" {
  value = aws_instance.windows[*].subnet_id
}

output "sg_windows" {
  value = aws_instance.windows[*].vpc_security_group_ids
}
