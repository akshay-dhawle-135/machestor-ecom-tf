terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.31.0"
    }
     github = {
      source  = "integrations/github"
      version = "~> 5.7"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}


