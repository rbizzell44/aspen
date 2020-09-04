//// AUDIT PROJECT VARIABLES

variable "project_id" {
  type        = "string"
  description = "id of audit project"
}

variable "audit_bucket_name" {
  type        = "string"
  description = "name of audit bucket"
}

variable "folder_sink_name" {
  type        = "string"
  description = "name of sink for folders/projects"
}

variable "severity_level" {
  type        = "string"
  description = "logging level defaults to INFO"
  default     = "INFO"
}

variable "folder_name" {
  type        = "string"
  description = "name of folder"
}

variable "parent" {
  type        = "string"
  description = "parent to attach folder to"
}

variable "log_bucket_location" {
  type        = "string"
  description = "where to put the log bucket geographically"
}
