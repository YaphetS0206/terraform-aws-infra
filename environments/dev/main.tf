provider "aws" {
  region = var.region
}

module "vpc" {
  source     = "../../modules/vpc"
  cidr_block = "10.0.0.0/16"
  name       = "dev-vpc"
}

module "subnet" {
  source     = "../../modules/subnet"
  vpc_id     = module.vpc.vpc_id
  cidr_block = "10.0.1.0/24"
  name       = "dev-subnet"
}

module "ec2" {
  source         = "../../modules/ec2"
  subnet_id      = module.subnet.subnet_id
  ami            = var.ami
  instance_type  = "t3.micro"
  name           = "dev-ec2"
  env = "dev"
}