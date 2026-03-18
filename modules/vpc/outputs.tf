output "vpc_id" {
  value = aws_vpc.this.id
  description = "ID de la VPC creada"
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.this.id
  description = "ID del Internet Gateway"
}

output "route_table_id" {
  value       = aws_route_table.this.id
  description = "ID de la Route Table asociada"
}