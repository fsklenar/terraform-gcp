# 1. Create a Custom VPC Network
resource "google_compute_network" "vpc_network" {
  name                    = "${var.network_name}-vpc"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"

}

# 2. Create a Subnet within the VPC
resource "google_compute_subnetwork" "vpc_subnet" {
  name          = "${var.network_name}-subnet"
  ip_cidr_range = var.subnet_cidr_range
  region        = var.gcp_region
  network       = google_compute_network.vpc_network.self_link
}
