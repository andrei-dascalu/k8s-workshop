output "k8s_ingress_ip" {
  description = "IP for ingress"
  value       = google_compute_global_address.ip_address.address
}

output "k8s_ingress_name" {
  description = "Name for ingress"
  value       = google_compute_global_address.ip_address.name
}
