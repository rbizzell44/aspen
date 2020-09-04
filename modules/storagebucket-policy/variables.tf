variable "bucket_name" {
  description = "This must be a unique name"
}

variable "bucket_member" {
  description = "must be prefixed by user: or serviceAccount:"
  default     = ""
}

variable "role" {
  type = "string"
}