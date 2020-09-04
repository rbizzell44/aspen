/// Local Policy Variables

variable "allow_public_ip_vm" {
  default     = false
  description = "Set true to allow Compute Engine VM instances to use external IP addresses (at the FOLDER level)"
}

variable "folder_id" {
  type = "string"
}