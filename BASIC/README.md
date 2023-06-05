# Basic Cluster Scenario

Deploy a Kafka Cluster on a existing Confluent Cloud and Network (if needed).

Using the [Kafka Cluster Terraform Module](https://github.com/mcolomerc/terraform-confluent-kafka-cluster)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_confluent"></a> [confluent](#requirement\_confluent) | 1.42.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cluster"></a> [cluster](#module\_cluster) | mcolomerc/terraform-confluent-kafka-cluster | feature/optional_config_options |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_kms_key_alias"></a> [aws\_kms\_key\_alias](#input\_aws\_kms\_key\_alias) | Alias for AWS KMS Managed key | `string` | n/a | yes |
| <a name="input_aws_kms_key_description"></a> [aws\_kms\_key\_description](#input\_aws\_kms\_key\_description) | Description for AWS KMS Managed Key | `string` | n/a | yes |
| <a name="input_cluster"></a> [cluster](#input\_cluster) | Cluster definition | <pre>object({<br>    display_name = string<br>    availability = string<br>    cloud        = string<br>    region       = string<br>    type         = string<br>    cku          = optional(string)<br>    config       = optional(map(string))<br>  })</pre> | n/a | yes |
| <a name="input_confluent_cloud_api_key"></a> [confluent\_cloud\_api\_key](#input\_confluent\_cloud\_api\_key) | Confluent Cloud API KEY. export TF\_VAR\_confluent\_cloud\_api\_key="API\_KEY" | `string` | n/a | yes |
| <a name="input_confluent_cloud_api_secret"></a> [confluent\_cloud\_api\_secret](#input\_confluent\_cloud\_api\_secret) | Confluent Cloud API KEY. export TF\_VAR\_confluent\_cloud\_api\_secret="API\_SECRET" | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Confluent Cloud Environment ID | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS Region in wich we gonna create the KMS Managed Key | `string` | n/a | yes |
| <a name="input_service_account"></a> [service\_account](#input\_service\_account) | Service Account and Role for cluster management. | <pre>object({<br>    name = string<br>    role = string<br>  })</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->