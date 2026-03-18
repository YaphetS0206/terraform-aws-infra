variable "vpc_id" {
  description = "ID de la VPC donde se creará la Subnet"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block de la Subnet"
  type        = string
}

variable "name" {
  description = "Nombre de la Subnet"
  type        = string
}

variable "route_table_id" {
  description = "ID de la Route Table a asociar"
  type        = string
}