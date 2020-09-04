output "subnet_names" {
  value = ["${google_compute_subnetwork.vpc_subnets.*.name}"]
}

output "vpc_name" {
  value = "${google_compute_network.vpc.self_link}"
}
