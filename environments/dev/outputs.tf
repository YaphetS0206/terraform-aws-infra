output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "ID de la VPC creada"
}

output "subnet_id" {
  value       = module.subnet.subnet_id
  description = "ID de la Subnet creada"
}

output "ec2_id" {
  value       = module.ec2.instance_id
  description = "ID de la instancia EC2"
}