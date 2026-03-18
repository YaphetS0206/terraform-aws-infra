output "instance_id" {
  value = aws_instance.this.id
}

output "ami_id" {
  value = data.aws_ami.amazon_linux.id
}

output "ami_name" {
  value = data.aws_ami.amazon_linux.name
}