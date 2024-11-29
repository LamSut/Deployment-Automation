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

run "vpc_integration_test" {
  command = apply

  // gateway test
  assert {
    condition     = module.vpc.gw_vpc_id == module.vpc.vpc_id
    error_message = "Must attach this gateway to VPC!"
  }

  //subnet1 vpc id test
  assert {
    condition     = module.vpc.subnet1_vpc_id == module.vpc.vpc_id
    error_message = "This subnet must be inside the VPC!"
  }

  //route_table1 vpc id test
  assert {
    condition     = module.vpc.route_table1_vpc_id == module.vpc.vpc_id
    error_message = "This route table must be inside the VPC!"
  }

  //route_table1 gw id test
  assert {
    condition     = module.vpc.route_table1_gw_id[0] == module.vpc.gw
    error_message = "This route table must be attach to the gateway!"
  }

  //subnet1 association test
  assert {
    condition     = module.vpc.public_subnet1 == module.vpc.association_subnet1 && module.vpc.route_table1 == module.vpc.association_route_table1
    error_message = "Must attach this subnet to a route table!"
  }

  //subnet2 vpc id test
  assert {
    condition     = module.vpc.subnet2_vpc_id == module.vpc.vpc_id
    error_message = "This subnet must be inside the VPC!"
  }

  //route_table2 vpc id test
  assert {
    condition     = module.vpc.route_table2_vpc_id == module.vpc.vpc_id
    error_message = "This route table must be inside the VPC!"
  }

  //route_table2 gw id test
  assert {
    condition     = module.vpc.route_table2_gw_id[0] == module.vpc.gw
    error_message = "This route table must be attach to the gateway!"
  }

  //subnet2 association test
  assert {
    condition     = module.vpc.public_subnet2 == module.vpc.association_subnet2 && module.vpc.route_table2 == module.vpc.association_route_table2
    error_message = "Must attach this subnet to a route table!"
  }
}
