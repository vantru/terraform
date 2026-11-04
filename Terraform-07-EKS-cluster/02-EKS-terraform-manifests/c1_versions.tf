terraform {
  required_version = ">= 1.12.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.0"
    }
  }

  # Remote backend configuration using s3
  backend "s3"{
      bucket       = "tfstate-dev-ap-southeast-2-5agto8"
      key          = "eks/dev/terraform.tfstate"
      region       = "ap-southeast-2"
      encrypt      = true
      use_lockfile = true   # native S3 locking (Terraform >= 1.10)
  }
}

provider "aws" {
  region = var.aws_region
}