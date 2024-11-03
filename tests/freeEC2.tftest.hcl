variables {
  ami_amazon_linux_2023      = "ami-06b21ccaeff8cd686"
  ami_ubuntu_server_24_04    = "ami-0866a3c8686eaeeba"
  ami_ms_windows_server_2022 = "ami-0324a83b82023f0b3"
  //more ami

  instance_type = "t2.micro"
  //more instace type
}

run "ami_tests" {
  command = plan
  assert {
    condition     = module.ec2.ami == var.ami_amazon_linux_2023 || module.ec2.ami == var.ami_ubuntu_server_24_04 || module.ec2.ami == var.ami_ms_windows_server_2022
    error_message = "Invalid or not a free AMI type!"
  }
}

run "instance_type_tests" {
  command = plan
  assert {
    condition     = module.ec2.instance_type == var.instance_type
    error_message = "Invalid or not a free instance type!"
  }
}

