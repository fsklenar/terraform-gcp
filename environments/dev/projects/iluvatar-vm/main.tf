# Data source to read the shared VPC state
data "terraform_remote_state" "vpc_network" {
  backend = "gcs"
  config = {
    bucket = "tf-state-iluvatar"
    prefix = "terraform/state/vpc"
  }
}

data "terraform_remote_state" "vpc_subnet" {
  backend = "gcs"
  config = {
    bucket = "tf-state-iluvatar"
    prefix = "terraform/state/vpc"
  }
}

# Create a Firewall Rule to allow SSH (port 22)
resource "google_compute_firewall" "allow_ssh" {
  name    = "${var.network_name}-allow-ssh"
  network = data.terraform_remote_state.vpc_network.outputs.vpc_name

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
  network = data.terraform_remote_state.vpc_network.outputs.vpc_name

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

# Create the Compute Engine VM Instance
resource "google_compute_instance" "vm_instance" {
  name         = "${var.vm_name}"
  machine_type = var.vm_machine_type
  zone         = var.gcp_zone
  tags         = ["${var.network_name}-vm"] # Apply the tag for the firewall rule

  # Boot disk configuration
  boot_disk {
    initialize_params {
      image = var.vm_image
      size  = var.vm_size
    }
  }

  # Network interface configuration
  network_interface {
    subnetwork = data.terraform_remote_state.vpc_subnet.outputs.subnet_self_link
    access_config {} # Required to get an external IP
  }

  # Add your SSH public key for access (replace with your actual public key)
  metadata = {
    ssh-keys = "${var.vm_user}:${file(var.ssh_public_key_path)}"
  }
}

