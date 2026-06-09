

variable "subnet_cidr_range" {
  description = "The CIDR range for the subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "default_labels" {
  description = "Global default labels"
  type        = map(string)
  default = {
    managed_by = "terraform"
  }
}
