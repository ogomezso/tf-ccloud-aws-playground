terraform {
  required_version = ">= 0.14.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 4.63.0"
    }
  }
}
provider "aws" {
  region     = "eu-west-1"
}

resource "aws_s3_bucket" "tf-state-bucket" {
  bucket = "west1-ogomez-tf-state"
  
  tags = {
    Name            = "west1-ogomez-tf-state"
    confluent_owner = "Oscar Gomez"
    confluent_mail  = "ogomezsoriano@confluent.io"
  }
}
