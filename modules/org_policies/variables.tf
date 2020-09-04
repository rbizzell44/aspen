/// Local Policy Variables

variable "org_id" {
  description = "Organization ID"
}

variable "disable_default_network" {
  default     = false
  description = "Set true to disable creation of default network and associated resources"
}

variable "restrict_lien_removal" {
  default     = false
  description = "Set true to restrict the set of users who can remove a Shared VPC project lien"
}

variable "resource_location_restriction" {
  default     = []
  description = "Specify regions to allow resource creation"
}