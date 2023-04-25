terraform {
  required_providers {
    confluent = {
      source = "confluentinc/confluent"
      version = "1.39.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "4.63.0"
    }
  }
}

provider "aws" {
  region     = "eu-west-1"
}

provider "confluent" {
  cloud_api_key    = var.confluent_cloud_api_key
  cloud_api_secret = var.confluent_cloud_api_secret
}