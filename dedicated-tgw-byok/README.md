# Dedicated, Self Encrypted (BYOK) Confluent Cluster over AWS Transit Gateway deployment example

This scenario shows you how to deploy a dedicated cluster with self encryption feature using [BYOK](https://docs.confluent.io/cloud/current/clusters/byok/byok-aws.html)

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.0.1 |
| <a name="requirement_confluent"></a> [confluent](#requirement\_confluent) | 1.42.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | ~> 4.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_novo_dedicate_tgw_byok"></a> [novo\_dedicate\_tgw\_byok](#module\_novo\_dedicate\_tgw\_byok) | github.com/ogomezso/terraform-confluent-aws | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_confluent_cloud_api_key"></a> [confluent\_cloud\_api\_key](#input\_confluent\_cloud\_api\_key) | Confluent Cloud API KEY. export TF\_VAR\_confluent\_cloud\_api\_key="API\_KEY" | `string` | n/a | yes |
| <a name="input_confluent_cloud_api_secret"></a> [confluent\_cloud\_api\_secret](#input\_confluent\_cloud\_api\_secret) | Confluent Cloud API KEY. export TF\_VAR\_confluent\_cloud\_api\_secret="API\_SECRET" | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->