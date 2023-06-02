environment = "env-q26337"

cluster = {
    display_name = "STD-GCP"
    availability = "SINGLE_ZONE"
    cloud        = "AWS"
    region       = "eu-west-1"
    type         = "STANDARD"
 }


service_account = {
    name = "CC-WEBINAR"
    role = "CloudClusterAdmin"
}

region = "eu-west-1"
aws_kms_key_alias = "basic-byok-key"
aws_kms_key_description = "basic byok test"