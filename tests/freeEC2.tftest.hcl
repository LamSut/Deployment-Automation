variables {
  ami_amazon_linux_2023 = "ami-06b21ccaeff8cd686"
  ami_amazon_linux_hvm  = "ami-0ddc798b3f1a5117e"
  //more ami
  instance_type = "t2.micro"
  //more instace type
}

run "ec2_tests" {
  command = plan

  assert {
    condition     = module.ec2.ami == var.ami_amazon_linux_2023 || module.ec2.ami == var.ami_amazon_linux_hvm
    error_message = "Invalid or not a free AMI type!"
  }

  assert {
    condition     = module.ec2.instance_type == var.instance_type
    error_message = "Invalid or not a free instance type!"
  }
}

