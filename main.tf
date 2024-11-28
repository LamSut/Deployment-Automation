module "vpc" {
  source = "./vpc"
}

module "ec2" {
  source         = "./ec2"
  subnet1        = module.vpc.public_subnet1
  subnet2        = module.vpc.public_subnet2
  security_group = module.vpc.security_group
}
