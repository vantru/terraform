module "vpc" {
  source  = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  subnet_newbits = var.subnet_newbits
  tags = var.tags
  aws_environment = var.aws_environment
  
}