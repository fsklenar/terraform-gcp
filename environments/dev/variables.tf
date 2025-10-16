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

variable "subnet_cidr_range" {
  description = "The CIDR range for the subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "vm_name" {
  description = "The name of the VM instance."
  type        = string
}

variable "vm_machine_type" {
  description = "The machine type for the VM."
  type        = string
  default     = "e2-micro"
}

variable "vm_image" {
  description = "The boot disk image for the VM."
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-minimal-2404-lts-amd64"
}

variable "vm_size" {
  description = "Size of the boot disk image for the VM."
  type        = string
  default     = "10"
}

variable "vm_user" {
  description = "The username to use for SSH access."
  type        = string
  default     = "ubuntu"
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key file (e.g., ~/.ssh/id_rsa.pub)."
  type        = string
}

variable "default_labels" {
  description = "Global default labels"
  type        = map(string)
  default = {
    managed_by = "terraform"
  }
}
