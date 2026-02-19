# Data source to read the shared VPC state
data "terraform_remote_state" "vpc_network" {
  backend = "gcs"
  config = {
    bucket = "tf-state-gce"
    prefix = "terraform/state/vpc"
  }
}

data "terraform_remote_state" "vpc_subnet" {
  backend = "gcs"
  config = {
    bucket = "tf-state-gce"
    prefix = "terraform/state/vpc"
  }
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

