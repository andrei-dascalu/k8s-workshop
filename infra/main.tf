provider "google" {
  project = var.gke_project
  region  = var.gke_region
  zone    = var.gke_zone
}

resource "google_service_account" "cluster_account" {
  account_id   = "sa-k8s-workshop"
  display_name = "K8s Workshop SA"
}

resource "google_container_cluster" "primary" {
  name               = var.gke_k8s_name
  location           = var.gke_zone
  initial_node_count = 2
  node_version       = var.gke_k8s_version
  min_master_version = var.gke_k8s_version

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    service_account = google_service_account.cluster_account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/compute.readonly"
    ]
  }

  timeouts {
    create = "30m"
    update = "40m"
  }
}

resource "google_compute_global_address" "ip_address" {
  name = "ws-static"
  project = var.gke_project
}
