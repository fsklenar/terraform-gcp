# Output the external IP address of the VM
output "vm_external_ip" {
  value = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
}

output "vm_external_ipv6" {
  value = google_compute_instance.vm_instance.network_interface[0].ipv6_access_config[0].external_ipv6
}
