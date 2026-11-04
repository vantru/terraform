# Resource block: Random String
resource "random_string" "suffix" {
  length           = 6
  special          = false
  upper = false
}

# Resource Block
resource "aws_s3_bucket" "demo_bucket" {
  bucket = "devopsdemo-${random_string.suffix.result}"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Owner = "trutran"
    Organization = "anywell"
  }
}
