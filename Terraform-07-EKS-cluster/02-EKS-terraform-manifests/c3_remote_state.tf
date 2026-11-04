data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "tfstate-dev-ap-southeast-2-5agto8"
    region = var.aws_region
    key = "eks/dev/terraform.tfstate"
  }
}

output "vpc_id" {
  value =  data.terraform_remote_state.vpc.output.vpc_id
}

output "private_subnet_ids" {
  value = data.terraform_remote_state.vpc.outputs.private_subnets_ids
}

output "public_subnet_ids" {
  value = data.terraform_remote_state.vpc.outputs.public_subnets_ids
}