module "cluster" {
  source                     = "mcolomerc/terraform-confluent-kafka-cluster?ref=feature/optional_config_options"
  confluent_cloud_api_key    = var.confluent_cloud_api_key
  confluent_cloud_api_secret = var.confluent_cloud_api_secret
  environment                = var.environment
  cluster                    = var.cluster
  service_account            = var.service_account
}