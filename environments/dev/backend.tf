#terraform {
#  backend "s3" {
#    bucket = "tf-state-bucket-dev"
#    key    = "dev/terraform.tfstate"
#    region = "us-west-2"
#    dynamodb_table = "terraform-locks"

#    encrypt = true
#  }
#}