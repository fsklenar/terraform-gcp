terraform {
  backend "gcs" {
    bucket = "tf-state-gce"
    prefix = "terraform/state/vpc"
  }
}
