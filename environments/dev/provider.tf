# Configure the Google Cloud provider
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.7"
    }
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region

  add_terraform_attribution_label = true

  default_labels = {
    terraform = "true"
    source    = replace(replace(path.cwd, "/^.*?(${"terraform"}\\/)/", "$1"), "/", "-")
  }
}
