variable "confluent_cloud_api_key" {
  type = string
  description = "Confluent Cloud API KEY. export TF_VAR_confluent_cloud_api_key=\"API_KEY\""
}

variable "confluent_cloud_api_secret" {
  type = string
   description = "Confluent Cloud API KEY. export TF_VAR_confluent_cloud_api_secret=\"API_SECRET\""
}

variable "kafka_api_key" {
  type = string
  description = "Confluent Cloud Kafka Cluster Admin API Key. export TF_VAR_kafka_api_key=\"API_KEY\""
}

variable "kafka_api_secret" {
  type = string
  description = "Confluent Cloud Kafka cluster Admin API Key Secret. export TF_VAR_kafka_api_secret=\"API_SECRET\""
}

variable "environment" {
  type = string
  description = "Confluent Cloud Environment Id"
}

variable "cluster" {
  type = string
  description = "Confluent Kafka Cluster Id"
}

variable "topics" {
  type = list(object({
    name = string
    partitions = number
    config =  optional(map(string))
  }))
  description = "List of Topics"
}


