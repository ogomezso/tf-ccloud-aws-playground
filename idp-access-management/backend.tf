terraform {
  backend "s3" {
    bucket                 = "west1-ogomez-tf-state"
    key                    = "tf-state/novo/iam/idp"
    skip_region_validation = true
  }
}
