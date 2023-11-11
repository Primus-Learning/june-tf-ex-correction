terraform {
  backend "s3"{
    bucket = "demo-aziz-22333"
    key    = "dev/terraform.tfstate"
    profile = "tf"
    region = "us-east-1"
    dynamodb_table = "tfstate"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.24.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "tf"
}
