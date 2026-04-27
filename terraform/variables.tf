# Azure Configuration
variable "subscription_id" {
  type      = string
  sensitive = true
}

variable "resource_group_name" {
  type = string
}

# Key Vault
variable "key_vault_name" {
  type = string
}

# Project
variable "project_name" {
  type = string
}

variable "vm_size" {
  type    = string
  default = "Standard_B2s"
}

variable "address_space" {
  type = list(string)
}

variable "address_prefixes" {
  type = list(string)
}

# Other
variable "allowed_ip" {
  type = string
}
