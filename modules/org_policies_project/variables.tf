/// Local Policy Variables

variable "allow_public_ip_vm" {
  default     = false
  description = "Set true to allow Compute Engine VM instances to use external IP addresses (at the PROJECT level)"
}

variable "project_id" {
  type = "string"
}
