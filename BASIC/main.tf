module "byok" {
  providers = {
      confluent = confluent.confluent_cloud
  }
  source                     = "../../terraform-confluent-aws-byok"
  aws_region                 = var.region
  aws_kms_key_alias          = var.aws_kms_key_alias
  aws_kms_key_description    = var.aws_kms_key_description
  confluent_cloud_api_key    = var.confluent_cloud_api_key
  confluent_cloud_api_secret = var.confluent_cloud_api_secret
}

module "cluster" {
  source                     = "../../terraform-confluent-kafka-cluster"
  confluent_cloud_api_key    = var.confluent_cloud_api_key
  confluent_cloud_api_secret = var.confluent_cloud_api_secret
  environment                = var.environment
  cluster                    = var.cluster
  service_account            = var.service_account
}