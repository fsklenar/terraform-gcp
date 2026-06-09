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

  stack_type       = "IPV4_IPV6"
  ipv6_access_type = "EXTERNAL"
}

# Create a Firewall Rule to allow SSH (port 22)
resource "google_compute_firewall" "allow_ssh" {
  name    = "${var.network_name}-allow-ssh"
  network = module.vpc.network_name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["37.139.8.159/32","35.235.240.0/20"]
  target_tags   = ["${var.network_name}-vm"]
}

# Create a Firewall Rule to allow HTTP(s) (port 80,443) and ICMP (ping)
resource "google_compute_firewall" "allow_http_icmp" {
  name    = "${var.network_name}-allow-http-icmp"
  network = module.vpc.network_name

  allow {
    protocol = "tcp"
    ports    = ["80","443"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"] # Allow from any IP address
  target_tags   = ["${var.network_name}-vm"]
}

# Nové pravidlo pre IPv6
resource "google_compute_firewall" "allow_http_icmp_ipv6" {
  name    = "${var.network_name}-allow-http-icmp-ipv6"
  network = module.vpc.network_name

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  allow {
    protocol = "58"  # ICMPv6
  }

  source_ranges = ["::/0"]
  target_tags   = ["${var.network_name}-vm"]
}
