# Confluent Cloud Credentials  
variable "confluent_cloud_api_key" {
  type        = string
  description = "Confluent Cloud API KEY. export TF_VAR_confluent_cloud_api_key=\"API_KEY\""
}

variable "confluent_cloud_api_secret" {
  type        = string
  description = "Confluent Cloud API KEY. export TF_VAR_confluent_cloud_api_secret=\"API_SECRET\""
}

# Confluent cloud environment id  
variable "environment" {
  type        = string
  description = "Confluent Cloud Environment ID"
}

# Cluster definition
variable "cluster" {
  type = object({
    display_name = string
    availability = string
    cloud        = string
    region       = string
    type         = string
    cku          = optional(string)
    config       = optional(map(string))
  })
}

# Confluent Cloud Service Account  
variable "service_account" {
  description = "Service Account and Role for cluster management."
  type = object({
    name = string
    role = string
  })
}

variable "region" {
    type = string
    description = "AWS Region in wich we gonna create the KMS Managed Key"
}

variable "aws_kms_key_alias" {
   type = string
   description = "Alias for AWS KMS Managed key"
}

variable "aws_kms_key_description" {
    type = string
    description = "Description for AWS KMS Managed Key"
}