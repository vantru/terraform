#environment & Region
environment_name = "dev1"
aws_region = "ap-southeast-2"

# CIDR for VPC
vpc_cidr = "10.1.0.0/16"
#Subnet mask
subnet_newbits = 8

#Tag
tags = {
    Terraform = "true"
    Project = "retail-store"
    Owner = "Tru Tran Already"
    Cource = "ok"
    Demo = "terraform.tfvars demo"
}
