terraform {
  backend "gcs" {
    bucket  = "tf-state-iluvatar"
    prefix  = "terraform/state/vpc"
  }
}
