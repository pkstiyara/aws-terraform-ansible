terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.32.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}