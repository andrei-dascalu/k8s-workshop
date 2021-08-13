output "k8s_ingress_ipvalue" {
  description = "IP for ingress"
  value       = google_compute_global_address.ip_address.address
}

output "k8s_ingress_ipname" {
  description = "Name for ingress"
  value       = google_compute_global_address.ip_address.name
}
