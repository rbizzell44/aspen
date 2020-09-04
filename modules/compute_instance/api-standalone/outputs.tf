output "instance_name" {
  description = "Name of the instance to be output for instance group use"
  value       = "${google_compute_instance.default.self_link}"
}