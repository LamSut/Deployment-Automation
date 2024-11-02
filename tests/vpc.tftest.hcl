variables {
  enable_dns_hostnames = true
  enable_dns_support   = true
  //more
}

run "vpc_tests" {
  command = plan

  assert {
    condition     = module.vpc.enable_dns_hostnames == var.enable_dns_hostnames && module.vpc.enable_dns_support == var.enable_dns_support
    error_message = "Must enable DNS!"
  }

}

