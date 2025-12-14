module "vpc" {
  source  = "terraform-google-modules/network/google//modules/vpc"
  version = ">= 12.0"

  project_id              = var.gcp_project_id
  network_name            = "${var.network_name}-vpc"
  auto_create_subnetworks = false

  routing_mode = "REGIONAL"

  shared_vpc_host = false
}

# 2. Create a Subnet within the VPC
resource "google_compute_subnetwork" "vpc_subnet" {
  name          = "${var.network_name}-subnet"
  ip_cidr_range = var.subnet_cidr_range
  region        = var.gcp_region
  network       = module.vpc.network_self_link
}

