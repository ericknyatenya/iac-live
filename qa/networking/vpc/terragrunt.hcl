locals {
  env    = "qa"
  name   = "vpc-qa"
  tags   = { env = local.env }
  region = "us-east-1"
}

terraform {
  source = "git::https://github.com/ericknyatenya/iac-modules.git//networking/vpc?ref=v0.1.0"
}

inputs = {
  name       = local.name
  cidr_block = "10.2.0.0/16"
  tags       = local.tags
}

remote_state {
  backend = "s3"
  config = {
    bucket         = "homelab-qa-tfstate"
    key            = "networking/vpc/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "homelab-qa-tf-locks"
    encrypt        = true
  }
}
