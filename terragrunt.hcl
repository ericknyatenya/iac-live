# Root Terragrunt config
locals {
  common_tags = {
    owner      = "erick"
    managed-by = "terraform"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "aws" {
  region = var.region
}
variable "region" {
  type    = string
  default = "us-east-1"
}
EOF
}
