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
  cloud_api_key    = "VGOXTPCSF3X7C6OI"
  cloud_api_secret = "sVrZ2E62wxE43XxvxqtNIgwc/qj13Z3Kt7KIRZLEh+WlUngq2RqHJQa390+4pbkN"
}