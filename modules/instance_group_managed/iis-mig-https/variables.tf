// Required Instance Template Variables

variable project_id {
  description = "Project ID of project to use for resources"
}

variable region {
  description = "Region for cloud resources"
}

variable compute_image {
  description = "Image used for the compute VMs"
}

variable labels {
  description = "Map of labels to be used on all instances"
  type        = "map"
}

variable target_tags {
  description = "Tag added to instances for firewall and networking."
  type        = "list"
  default     = []
}

variable subnetwork {
  description = "The subnetwork the instance group is deployed to"
}

variable disk_type {
  description = "The GCE disk type. Can be either pd-ssd, local-ssd, or pd-standard."
}

variable disk_size_gb_1 {
  description = "The size of the image in gigabytes. If not specified, it will inherit the size of its base image."
  default     = 0
}

variable disk_size_gb_2 {
  description = "The size of the image in gigabytes. If not specified, it will inherit the size of its base image."
  default     = 0
}

variable disk_size_gb_3 {
  description = "The size of the image in gigabytes. If not specified, it will inherit the size of its base image."
  default     = 0
}

variable disk_size_gb_4 {
  description = "The size of the image in gigabytes. If not specified, it will inherit the size of its base image."
  default     = 0
}

variable disk_size_gb_5 {
  description = "The size of the image in gigabytes. If not specified, it will inherit the size of its base image."
  default     = 0
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


// Required Instance Manager Variables

variable name {
  description = "Name of managed instance group and related resources (e.g. instance template)"
}

variable stack_initials {
  description = "Initials of stack"
}

variable app_initials {
  description = "Application initials of application"
}

variable env_initials {
  description = "Environment initials of stack"
}

variable target_size {
  description = "Target size for managed instance group"
  default     = 1
}

variable healing_delay {
  description = "Time delay for autohealing"
}



// Autohealing Variables

variable interval_check {
  description = "Frequency at which a health check is conducted"
}

variable timeout_period {
  description = "Timeout period for health check"
}

variable healthy_threshold {
  description = "Number of consecutive successes required to be considered healthy"
}

variable unhealthy_threshold {
  description = "Number of consecutive failures required to be considered unhealthy"
}

variable health_check_request_path {
  description = "Path for health check."
}




// Autoscaling Variables

variable autoscaling {
  description = "Enable autoscaling."
  default     = false
}

variable min_replicas {
  description = "Autoscaling, min replicas."
  default     = 1
}

variable max_replicas {
  description = "Autoscaling, max replicas."
  default     = 2
}

variable cooldown_period {
  description = "Autoscaling, cooldown period in seconds."
  default     = 60
}

variable autoscaling_cpu {
  description = "Autoscaling, cpu utilization policy block as single element array. https://www.terraform.io/docs/providers/google/r/compute_autoscaler.html#cpu_utilization"
}

variable autoscaling_metric {
  description = "Autoscaling, metric policy block as single element array. https://www.terraform.io/docs/providers/google/r/compute_autoscaler.html#metric"
  type        = "list"
  default     = []
}

variable autoscaling_lb {
  description = "Autoscaling, load balancing utilization policy block as single element array. https://www.terraform.io/docs/providers/google/r/compute_autoscaler.html#load_balancing_utilization"
  type        = "list"
  default     = []
}




## Optional Variables

variable machine_type {
  description = "Machine type for the VMs in the instance group."
  default     = "n2-standard-2" // 2 cores, 8 GB RAM
}

variable subnetwork_project {
  description = "The project the subnetwork belongs to. If not set, the current project is used instead."
  default     = ""
}

variable disk_auto_delete {
  description = "Whether or not the disk should be auto-deleted."
  default     = true
}

variable automatic_restart {
  description = "Automatic restart boolean for instances"
  default     = true
}

variable api_scopes {
  description = "GCS default access for compute instances"
  //default     = "storage-full"
  default = ["storage-full", "monitoring", "logging-write"]
}