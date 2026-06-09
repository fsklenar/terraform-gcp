variable "gcp_project_id" {
  description = "The GCP project ID to deploy resources into."
  type        = string
}

variable "gcp_region" {
  description = "The GCP region to deploy the network and subnet."
  type        = string
}

variable "gcp_zone" {
  description = "The GCP zone for the VM instance."
  type        = string
}

variable "network_name" {
  description = "A unique name for the VPC network and prefix for other resources."
  type        = string
  default     = "iluvatar-network"
}

