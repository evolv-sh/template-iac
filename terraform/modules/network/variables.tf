# Azure
variable "resource_group_name" {
  type = string
}

# Project
variable "project_name" {
  type = string
}

variable "location" {
  type = string
}

variable "address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "address_prefixes" {
  type = list(string)
}

# Other
variable "allowed_ip" {
  type = string
}
