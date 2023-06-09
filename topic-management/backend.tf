terraform {
  backend "s3" {
    bucket                 = "west1-ogomez-tf-state"
    key                    = "tf-state/novo/resources/rbac"
    skip_region_validation = true
  }
}
