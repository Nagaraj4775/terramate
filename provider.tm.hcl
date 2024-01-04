generate_hcl "_provider.tf" {
  content {

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> ${global.provider_ver}"
    }
  }
  required_version = "~> 1.2"
}

provider "aws" {
  region = "us-east-1"
}
}
}
