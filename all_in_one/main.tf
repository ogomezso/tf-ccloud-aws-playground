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
  display_name = "inventory"
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
