variable "region" {
  description = "AWS region"
}
variable "ami" {
  description = "AMI ID for the EC2 instance"
}
variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}
variable "env" {
  description = "Environment name"
  type        = string
  default = "dev"
}