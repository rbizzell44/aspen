## Required variables

variable project_id {
  description = "Project ID of project to use for resources"
}

variable compute_image {
  description = "Image used for the compute VMs"
}

variable region {
  description = "Region for cloud resources"
}

variable zone {
  description = "Zone for cloud resources"
}


// Instance Naming

variable stack_initials {
  description = "Initials of stack"
}

variable app_initials {
  description = "Application initials of application"
}

variable env_initials {
  description = "Environment initials of stack"
}

variable target_tags {
  description = "Tag added to instances for firewall and networking."
  type        = "list"
  default     = []
}

variable labels {
  description = "Map of labels to be used on all instances"
  type        = "map"
}


// Network and Miscellaneous

variable subnetwork {
  description = "The subnetwork the instance group is deployed to"
}

variable service_account_email {
  description = "The service account to use for all instances in this instance group."
}

variable metadata {
  description = "Name of metadata startup values to pass to instances."
  default     = ""
}

variable bucketstore_name {
  description = "Name of bucket to pull metadata"
  default     = ""
}

variable addomain {
  type    = "string"
  default = "admi.com"
}


// Disk Variables

variable boot_disk_size {
  description = "The size of the image in gigabytes."
}

variable disk_type {
  description = "The GCE disk type. Can be either pd-ssd, local-ssd, or pd-standard."
}

variable disk_size_gb_2 {
  description = "The size of the image in gigabytes. If not specified, it will inherit the size of its base image."
  default     = 0
}

variable disk_size_gb_3 {
  description = "The size of the image in gigabytes. If not specified, it will inherit the size of its base image."
  default     = 0
}

variable disk_name_2 {
  description = "Name of disk"
  default     = ""
}

variable disk_name_3 {
  description = "Name of disk"
  default     = ""
}

## Optional Variables

variable machine_type {
  description = "Custom VM in instance group. Format example = `custom-6-23040` where first number is # cores and second number is GB ram x 1024 bytes"
}

variable subnetwork_project {
  description = "The project the subnetwork belongs to. If not set, the current project is used instead."
  default     = ""
}

variable api_scopes {
  description = "GCS default access for compute instances"
  default     = "storage-full"
}