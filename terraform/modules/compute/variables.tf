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

variable "vm_size" {
  type = string
}

variable "network_interface_ids" {
  type = list(string)
}

variable "ssh_public_key" {
  type = string
}

variable "key_vault_name" {
  type = string
}
