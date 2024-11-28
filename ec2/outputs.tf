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
