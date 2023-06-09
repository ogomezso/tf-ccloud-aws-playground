variable "confluent_cloud_api_key" {
  type        = string
  description = "Confluent Cloud API KEY. export TF_VAR_confluent_cloud_api_key=\"API_KEY\""
}

variable "confluent_cloud_api_secret" {
  type        = string
  description = "Confluent Cloud API KEY. export TF_VAR_confluent_cloud_api_secret=\"API_SECRET\""
}

variable "environment" {
  type        = string
  description = "Confluent Cloud Environment Id"
}

variable "cluster" {
  type        = string
  description = "Confluent Kafka Cluster Id"
}

variable "identity_provider" {
  type        = string
  description = "Identity provider Id"
}

variable "identity_pools" {
  type = list(object({
    identity_pool = object({
      display_name   = string
      description    = optional(string)
      identity_claim = string
      filter         = string
    })
    roles = list(object({
      resource        = string
      resource_prefix = string
      role            = string
    }))
  }))
}
