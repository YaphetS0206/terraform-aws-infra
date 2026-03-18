variable "subnet_id" {
  description = "Subnet donde se lanzará la EC2"
  type        = string
}

variable "ami" {
  description = "AMI de la EC2"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
}

variable "key_name" {
  description = "Key pair para SSH"
  type        = string
}

variable "env" {
  description = "Nombre del ambiente (dev, prod, etc.)"
  type        = string
}
variable "name" {
  description = "Nombre de la instancia EC2"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC donde se creará el Security Group"
  type        = string
}