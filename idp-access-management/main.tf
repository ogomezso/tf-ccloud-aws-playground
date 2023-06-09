module "rbac" {
  source                     = "github.com/ogomezso/terraform-confluent-idp"
  confluent_cloud_api_key    = var.confluent_cloud_api_key
  confluent_cloud_api_secret = var.confluent_cloud_api_secret
  cluster                    = var.cluster
  environment                = var.environment
  identity_provider          = var.identity_provider
  identity_pools             = var.identity_pools
}
