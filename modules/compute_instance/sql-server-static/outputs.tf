output "instance_name" {
  description = "Name of the instance to be output for instance group use"
  value       = "${google_compute_instance.default.self_link}"
}

//output "instance_ip_addr_1" {
//  value = "${google_compute_instance.default.network_ip}"
//}
//output "instance_ip_addr_2" {
//  value = "${google_compute_instance.default.alias_ip_range}"
//}