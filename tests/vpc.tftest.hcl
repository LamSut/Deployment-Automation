run "vpc_tests" {
  command = plan

  assert {
    condition     = module.vpc.enable_dns_hostnames == true
    error_message = "Must enable DNS hostname resolution!"
  }

  assert {
    condition     = module.vpc.enable_dns_support == true
    error_message = "Must enable DNS resolution!"
  }
}

run "subnet1_tests" {
  command = plan

  assert {
    condition     = module.vpc.map_public_ip_on_launch == true
    error_message = "EC2 should be able to receive a public IP address!"
  }

  assert {
    condition     = module.vpc.vpc_sm <= module.vpc.subnet1_sm
    error_message = "Subnet mask of the Subnet must be equal or greater than VPC!"
  }
}

run "subnet2_tests" {
  command = plan

  assert {
    condition     = module.vpc.map_public_ip_on_launch == true
    error_message = "EC2 should be able to receive a public IP address!"
  }

  assert {
    condition     = module.vpc.vpc_sm <= module.vpc.subnet2_sm
    error_message = "Subnet mask of the Subnet must be equal or greater than VPC!"
  }
}

