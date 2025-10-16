output "vpc_name" {
  value       = google_compute_network.vpc_network.name
  description = "The name of the VPC being created"
}

output "vpc_self_link" {
  value       = google_compute_network.vpc_network.self_link
  description = "The URI of the VPC being created"
}

output "subnet_self_link" {
  value       = google_compute_subnetwork.vpc_subnet.self_link
  description = "The URI of the subnet being created"
}
