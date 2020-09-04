variable "subnets" {
  type = "map"
}

variable "project_id" {
  type = "string"
}

variable "source_range_ip" {
  type    = "list"
  default = []
}

variable "svpc_network_name" {
  type    = "string"
  default = ""
}
