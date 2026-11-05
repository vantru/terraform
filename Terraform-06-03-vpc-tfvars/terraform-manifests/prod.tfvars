#Environment & Region
environment_name = "production"
aws_region = "ap-southeast-2"

#CIDR
vpc_cidr = "10.3.0.0/24"
#Subnet mask
subnet_newbits  = 8

tags = {
    Terraform = "true"
    Cource = "demo var-file"
    Owner = " Tru Tran"
    Demo = "var-file"
}
