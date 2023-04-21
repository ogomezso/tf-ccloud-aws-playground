terraform {
  backend "s3" {
    bucket                 = "west1-ogomez-tf-state"
    key                    = "tf-state/novo/byok"
    skip_region_validation = true
  }
}
