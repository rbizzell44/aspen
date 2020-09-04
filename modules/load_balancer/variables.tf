# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These variables are expected to be passed in by the operator
# ---------------------------------------------------------------------------------------------------------------------

variable "project" {
  description = "The project ID to create the resources in."
  type        = string
}

variable "region" {
  description = "All resources will be launched in this region."
  type        = string
}

variable "name" {
  description = "Name for the load balancer forwarding rule and prefix for supporting resources."
  type        = string
}

variable "stack" {
  description = "Name of stack"
}

variable "static_ip_address" {
  description = "Static IP address within shared services networking VPC for internal load balacner"
}

variable "ports" {
  description = "List of ports (or port ranges) to forward to backend services. Max is 5."
  type        = list(string)
}

variable "health_check_port" {
  description = "Port to perform health checks on."
  type        = number
}

variable "instance-group-name" {
  description = "Name of backend managed instance group."
}

variable "network_project" {
  description = "The name of the GCP Project where the network is located. Useful when using networks shared between projects. If empty, var.project will be used."
  type        = string
}

variable "network" {
  description = "Self link of the VPC network in which to deploy the resources."
  type        = string
}

variable "subnetwork" {
  description = "Self link of the VPC subnetwork in which to deploy the resources."
  type        = string
}




# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL MODULE PARAMETERS
# These variables have defaults, but may be overridden by the operator.
# ---------------------------------------------------------------------------------------------------------------------

variable "protocol" {
  description = "The protocol for the backend and frontend forwarding rule. HTTPS."
  type        = string
  default     = "TCP"
}

variable "session_affinity" {
  description = "The session affinity for the backends, e.g.: NONE, CLIENT_IP. Default is `NONE`."
  type        = string
  default     = "NONE"
}

variable "http_health_check" {
  description = "Set to true if health check is type http, otherwise health check is tcp."
  type        = bool
  default     = false
}

variable "check_interval" {
  description = "How often to send a health check (seconds)."
}

variable "timeout_period" {
  description = "How long to wait before request considered failed (seconds)."
}

variable "healthy_threshold" {
  description = "Consecutive number of successes before instance considered healthy."
}

variable "unhealthy_threshold" {
  description = "Consecutive number of failures before instance considered unhealthy."
}