module "topics" {
  source                     = "github.com/mcolomerc/terraform-confluent-topics?ref=remove_rbac_settings"
  confluent_cloud_api_key    = var.confluent_cloud_api_key
  confluent_cloud_api_secret = var.confluent_cloud_api_secret
  kafka_api_key              = var.kafka_api_key
  kafka_api_secret           = var.kafka_api_secret
  environment                = var.environment
  cluster                    = var.cluster
  topics                     = var.topics
}
