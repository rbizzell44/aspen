variable "bu_prefix" {
  type = "string"
  default = "monitoring"
}

variable "ProgID2" {
  type = "string"
  default = "-ss-monitoring-nonprod"
}

variable "gce_ssh_user" {
  type = "string"
  default = ""
}

variable "gce_ssh_pub_key_file" {
  default = "../../../deployment/jasonpub.ssh"
}
variable "project_postfix" {
  default = "ss-monitoring-nonprod"
}