terraform {
  required_version = ">= 1.3"
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
      version = "1.42.0"
    }
  }
}

provider "confluent" {  
  alias = "confluent_cloud"
  cloud_api_key    = "${var.confluent_cloud_api_key}"
  cloud_api_secret = "${var.confluent_cloud_api_secret}"
}