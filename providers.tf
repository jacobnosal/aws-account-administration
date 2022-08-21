terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }

  backend "s3" {
    bucket = "tfstate-jnosal"
    key    = "aws-account-administration/terraform.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {}