provider "aws" {
  region = var.region
}

locals {
  key_name = "dev-key"
}
module "vpc" {
  source     = "../../modules/vpc"
  cidr_block = "10.0.0.0/16"
  name       = "dev-vpc"
}

module "subnet" {
  source     = "../../modules/subnet"
  route_table_id = module.vpc.route_table_id
  vpc_id     = module.vpc.vpc_id
  cidr_block = "10.0.1.0/24"
  name       = "dev-subnet"
}

module "ec2" {
  source         = "../../modules/ec2"
  subnet_id      = module.subnet.subnet_id
  vpc_id         = module.vpc.vpc_id
  ami            = var.ami
  instance_type  = "t3.micro"
  name           = "dev-ec2"
  key_name       = var.key_name
  env            = "dev"
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
  description = "IP pública de la EC2 en dev"
}