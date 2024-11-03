variables {
  ami_amazon_linux_2023      = "ami-06b21ccaeff8cd686"
  ami_ubuntu_server_24_04    = "ami-0866a3c8686eaeeba"
  ami_ms_windows_server_2022 = "ami-0324a83b82023f0b3"
  //more ami

  instance_type = "t2.micro"
  //more instace type
}

run "server_1_tests" {
  command = plan

  assert {
    condition     = module.ec2.ami_1 == var.ami_amazon_linux_2023 || module.ec2.ami_1 == var.ami_ubuntu_server_24_04 || module.ec2.ami_1 == var.ami_ms_windows_server_2022
    error_message = "Server 1: Invalid or not a free AMI type!"
  }

  assert {
    condition     = module.ec2.instance_type_1 == var.instance_type
    error_message = "Sever 1: Invalid or not a free instance type!"
  }
}

run "server_2_tests" {
  command = plan

  assert {
    condition     = module.ec2.ami_2 == var.ami_amazon_linux_2023 || module.ec2.ami_2 == var.ami_ubuntu_server_24_04 || module.ec2.ami_2 == var.ami_ms_windows_server_2022
    error_message = "Server 2: Invalid or not a free AMI type!"
  }

  assert {
    condition     = module.ec2.instance_type_2 == var.instance_type
    error_message = "Sever 2: Invalid or not a free instance type!"
  }
}

run "server_3_tests" {
  command = plan

  assert {
    condition     = module.ec2.ami_3 == var.ami_amazon_linux_2023 || module.ec2.ami_3 == var.ami_ubuntu_server_24_04 || module.ec2.ami_3 == var.ami_ms_windows_server_2022
    error_message = "Server 2: Invalid or not a free AMI type!"
  }

  assert {
    condition     = module.ec2.instance_type_3 == var.instance_type
    error_message = "Sever 2: Invalid or not a free instance type!"
  }
}
