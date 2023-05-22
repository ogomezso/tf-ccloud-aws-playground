data "aws_caller_identity" "current" {}

resource "confluent_environment" "main" {
  display_name = "ogomez-novo-sandbox"
}

data "confluent_schema_registry_region" "advanced" {
  cloud   = "AWS"
  region  = "eu-west-1"
  package = "ADVANCED"
}

resource "confluent_schema_registry_cluster" "advanced" {
  package = data.confluent_schema_registry_region.advanced.package

  environment {
    id = confluent_environment.main.id
  }

  region {
    id = data.confluent_schema_registry_region.advanced.id
  }
}

resource "confluent_network" "transit-gateway" {
  display_name     = "Transit Gateway Network"
  cloud            = "AWS"
  region           = "eu-west-1"
  cidr             = "192.168.0.0/16"
  connection_types = ["TRANSITGATEWAY"]
  environment {
    id = confluent_environment.main.id
  }
}

resource "confluent_transit_gateway_attachment" "aws" {
  display_name = "AWS Transit Gateway Attachment"
  aws {
    ram_resource_share_arn = "arn:aws:ram:eu-west-1:492737776546:resource-share/f193007a-e47c-4e5a-b3e1-2af956c1f252"
    transit_gateway_id     = "tgw-0bc2d610a10487f00"
    routes                 = ["10.0.0.0/16"]
  }
  environment {
    id = confluent_environment.main.id
  }
  network {
    id = confluent_network.transit-gateway.id
  }
  depends_on = [
    confluent_network.transit-gateway
  ]
}

resource "aws_kms_key" "main" {
  description = "ogomez novo sandbox byok-key"
}

resource "aws_kms_alias" "main" {
  name          = "alias/ogomez_novo_sandbox_byok"
  target_key_id = aws_kms_key.main.key_id
}

resource "confluent_byok_key" "main" {
  aws {
    key_arn = aws_kms_key.main.arn
  }
  depends_on = [
    aws_kms_alias.main,
    confluent_transit_gateway_attachment.aws
  ]
  lifecycle {
   prevent_destroy = true
 }
}
data "aws_iam_policy_document" "main" {
  statement {
    sid    = "Allow KMS Use"
    effect = "Allow"
    actions = [
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:DescribeKey",
      "kms:CreateGrant",
      "kms:ListGrants",
      "kms:RevokeGrant"

    ]
    principals {
      identifiers = confluent_byok_key.main.aws[0].roles
      type        = "AWS"
    }

    resources = [
      "*"
    ]
  }

  statement {
    sid    = "Enable IAM User Permissions"
    effect = "Allow"
    actions = [
      "*"
    ]
    resources = [
      "*"
    ]
    principals {
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
      ]
      type = "AWS"
    }
  }
}

resource "aws_kms_key_policy" "main" {
  key_id = aws_kms_key.main.id
  policy = data.aws_iam_policy_document.main.json
}

resource "confluent_kafka_cluster" "dedicated" {
  display_name = "tgw-byok-cluster"
  availability = "SINGLE_ZONE"
  cloud        = confluent_network.transit-gateway.cloud
  region       = confluent_network.transit-gateway.region
  dedicated {
    cku = 1
  }
  environment {
    id = confluent_environment.main.id
  }
  network {
    id = confluent_network.transit-gateway.id
  }
    byok_key {
    id = confluent_byok_key.main.id
  }
  depends_on = [
    confluent_transit_gateway_attachment.aws,
    aws_kms_key_policy.main
  ]
}

// ksqlDB service account
resource "confluent_service_account" "ksql-admin" {
  display_name = "ogomez-novo-ksql-admin-sa"
  description  = "Service account for ksqlDB cluster"
}
resource "confluent_role_binding" "ksql-admin" {
  principal   = "User:${confluent_service_account.ksql-admin.id}"
  role_name   = "KsqlAdmin"
  crn_pattern = confluent_ksql_cluster.ksql.resource_name
}

resource "confluent_role_binding" "ksql-schema-registry-resource-owner" {
  principal   = "User:${confluent_service_account.ksql-admin.id}"
  role_name   = "ResourceOwner"
  crn_pattern = format("%s/%s", confluent_schema_registry_cluster.advanced.resource_name, "subject=*")
}

resource "confluent_ksql_cluster" "ksql" {
  display_name = "tf-ksql"
  csu = 1
  kafka_cluster {
    id = confluent_kafka_cluster.dedicated.id
  }
  credential_identity {
    id = confluent_service_account.ksql-admin.id
  }
  environment {
    id = confluent_environment.main.id
  }
  depends_on = [
    confluent_role_binding.ksql-schema-registry-resource-owner,
    confluent_schema_registry_cluster.advanced
  ]
}

resource "confluent_role_binding" "app-ksql-all-topic" {
  principal   = "User:pool-4a14"
  role_name   = "ResourceOwner"
  crn_pattern = "${confluent_kafka_cluster.dedicated.rbac_crn}/kafka=${confluent_kafka_cluster.dedicated.id}/topic=*"
}

resource "confluent_role_binding" "app-ksql-all-group" {
  principal   = "User:pool-4a14"
  role_name   = "ResourceOwner"
  crn_pattern = "${confluent_kafka_cluster.dedicated.rbac_crn}/kafka=${confluent_kafka_cluster.dedicated.id}/group=*"
}

resource "confluent_role_binding" "app-ksql-all-transactions" {
  principal   = "User:pool-4a14"
  role_name   = "ResourceOwner"
  crn_pattern = "${confluent_kafka_cluster.dedicated.rbac_crn}/kafka=${confluent_kafka_cluster.dedicated.id}/transactional-id=*"
}
