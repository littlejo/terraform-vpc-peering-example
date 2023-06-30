terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 5.0"
    }
  }
  required_version = "> 1.4"
}

provider "aws" {
  default_tags {
    tags = {
      Terraform   = "true"
      Environment = "eks"
    }
  }
}
