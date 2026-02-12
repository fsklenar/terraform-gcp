terraform {
  backend "gcs" {
    bucket  = "tf-state-ai"
    prefix  = "terraform/state/vm"
  }
}
