module "novo_dedicate_tgw_byok" {
  source                            = "github.com/ogomezso/terraform-confluent-aws"
  region                            = "eu-west-1"
  aws_kms_key_alias                 = "ogomez_novo_byok"
  aws_prefix                        = "ogomez_novo_sandbox"
  aws_kms_key_description           = "AWS KMS Key BYOK Key"
  aws_owner                         = "ogomezsoriano@confluent.io"
  aws_vpc_public_subnets            = 3
  aws_vpc_private_subnets           = 3
  aws_bastion_name                  = "ogomez_novo_sandbox_bastion"
  aws_bastion_type                  = "t2.micro"
  confluent_env_name                = "ogomez_novo_sandox"
  confluent_env_sr_package          = "ADVANCED"
  confluent_network_display_name    = "novo_sandbox_ntwk"
  confluent_network_connection_type = "TRANSITGATEWAY"
  confluent_network_cidr            = "192.168.0.0/16"
  confluent_cluster = {
    display_name = "tgw-dedicated"
    availability = "SINGLE_ZONE"
    cloud        = "AWS"
    region       = "eu-west-1"
    type         = "DEDICATED"
    cku          = 1
  }

  confluent_service_account = {
    name = "CC-WEBINAR"
    role = "CloudClusterAdmin"
  }
  confluent_cloud_api_key    = var.confluent_cloud_api_key
  confluent_cloud_api_secret = var.confluent_cloud_api_secret
}
