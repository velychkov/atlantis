terraform {
  required_version = ">= 1.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.38.0"
    }
  }

  backend "s3" {
    bucket  = "velychkov-k8s"
    encrypt = true
    key     = "vpc/terraform.tfstate"
    region  = "eu-west-1"
  }
}

provider "aws" {
  region = var.region
}

