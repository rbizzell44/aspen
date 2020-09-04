## Required variables

variable name {
  description = "Name of the unmanaged instance group"
}

variable stack {
  description = "Name of stack"
}

variable environment {
  description = "Environment of stack"
}

variable project_id {
  description = "Project ID of project to use for resources"
}

variable region {
  description = "Region for cloud resources."
}

variable zone {
  description = "Zone for cloud resources."
}

variable instance_list {
  description = "List of compute instances to add to instance group"
}