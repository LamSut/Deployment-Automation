variables {
  ami_amazon_linux_2023 = "ami-06b21ccaeff8cd686"
  ami_ubuntu_ubuntu4_04 = "ami-0866a3c8686eaeeba"
  ami_ms_windows_22     = "ami-0324a83b82023f0b3"
  //more ami

  instance_type = "t2.micro"
  //more instace type
}

run "amazon_tests" {
  command = plan

  assert {
    condition = alltrue([
      for ami in module.ec2.ami_amazon : ami == var.ami_amazon_linux_2023
    ])
    error_message = "Amazon Linux Servers: Invalid or not a free AMI type!"
  }

  assert {
    condition = alltrue([
      for instance_type in module.ec2.instance_type_amazon : instance_type == var.instance_type
    ])
    error_message = "Amazon Linux Servers: Invalid or not a free instance type!"
  }
}

run "ubuntu_tests" {
  command = plan

  assert {
    condition = alltrue([
      for ami in module.ec2.ami_ubuntu : ami == var.ami_ubuntu_ubuntu4_04
    ])
    error_message = "Amazon Linux Servers: Invalid or not a free AMI type!"
  }

  assert {
    condition = alltrue([
      for instance_type in module.ec2.instance_type_ubuntu : instance_type == var.instance_type
    ])
    error_message = "Amazon Linux Servers: Invalid or not a free instance type!"
  }
}

run "windows_tests" {
  command = plan

  assert {
    condition = alltrue([
      for ami in module.ec2.ami_windows : ami == var.ami_ms_windows_22
    ])
    error_message = "Amazon Linux Servers: Invalid or not a free AMI type!"
  }

  assert {
    condition = alltrue([
      for instance_type in module.ec2.instance_type_windows : instance_type == var.instance_type
    ])
    error_message = "Amazon Linux Servers: Invalid or not a free instance type!"
  }
}
