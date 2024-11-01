module "vpc" {
  source = "./vpc"
}

module "ec2" {
  source         = "./ec2"
  subnet         = module.vpc.public_subnet
  security_group = module.vpc.security_group
}
