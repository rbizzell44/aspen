variable "bucket_name" {
  description = "This must be a unique name"
}

variable "log_bucket_name" {
  description = "This must be a unique name. Bucket where logs are kept"
  default     = ""
}

variable "location" {
  default = "us-central1"
}

variable "storage_class" {
  default = "REGIONAL"
}

variable "project_id" {
  type = string
}

variable "sa_email" {
  type = string
}

variable "role" {
  type = string
}

variable "force_destroy_property" {
  default = "false"
}

variable labels {
  description = "Map of labels to be used on all instances"
  type        = map
  default     = {}
}