variable "aws_region" {
  description = "AWS Region to deploy resources"
  type = string
  default = "ap-southeast-2"
}

variable "aws_environment" {
  description = "Dev environment for testing"
  type = string
  default = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "tags" {
  description = "Global tags to apply to all resources"
  type = map(string)
  default = {
    "Terraform" = "true"
  }
}

variable "subnet_newbits" {
  description = "Number of new bits to add to VPC CIDR"
  type = number
  default = 8
}