# Identity Pool Based Access Management Scenario

On this scenario you will find a way to manage resource access through Confluent Cloud Identity Pools based on a given Topic Naming Convention and Oauth Application strategy.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_confluent"></a> [confluent](#requirement\_confluent) | >=1.43.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_rbac"></a> [rbac](#module\_rbac) | github.com/ogomezso/terraform-confluent-idp | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster"></a> [cluster](#input\_cluster) | Confluent Kafka Cluster Id | `string` | n/a | yes |
| <a name="input_confluent_cloud_api_key"></a> [confluent\_cloud\_api\_key](#input\_confluent\_cloud\_api\_key) | Confluent Cloud API KEY. export TF\_VAR\_confluent\_cloud\_api\_key="API\_KEY" | `string` | n/a | yes |
| <a name="input_confluent_cloud_api_secret"></a> [confluent\_cloud\_api\_secret](#input\_confluent\_cloud\_api\_secret) | Confluent Cloud API KEY. export TF\_VAR\_confluent\_cloud\_api\_secret="API\_SECRET" | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Confluent Cloud Environment Id | `string` | n/a | yes |
| <a name="input_identity_pools"></a> [identity\_pools](#input\_identity\_pools) | n/a | <pre>list(object({<br>    identity_pool = object({<br>      display_name   = string<br>      description    = optional(string)<br>      identity_claim = string<br>      filter         = string<br>    })<br>    roles = list(object({<br>      resource        = string<br>      resource_prefix = string<br>      role            = string<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_identity_provider"></a> [identity\_provider](#input\_identity\_provider) | Identity provider Id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster"></a> [cluster](#output\_cluster) | n/a |
<!-- END_TF_DOCS -->