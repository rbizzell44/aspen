output name {
  description = "Name of the managed instance group and related resources, like the instance template."
  value       = "${var.name}"
}

//output instance_group {
//  description = "Link to the `instance_group` property of the region instance group manager resource."
//  value       = "${element(concat(google_compute_instance_group_manager.default.*.instance_group, list("")), 0)}"
//}

//output target_tags {
//  description = "Pass through of input `target_tags`."
//  value       = "${var.target_tags}"
//}

//output service_port {
//  description = "Pass through of input `service_port`."
//  value       = "${var.service_port}"
//}

//output service_port_name {
//  description = "Pass through of input `service_port_name`."
//  value       = "${var.service_port_name}"
//}
