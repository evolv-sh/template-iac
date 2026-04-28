terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.1.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

data "azurerm_key_vault" "main" {
  name                = var.key_vault_name
  resource_group_name = data.azurerm_resource_group.main.name
}

data "azurerm_key_vault_secret" "ssh" {
  name         = "ssh-public-keys"
  key_vault_id = data.azurerm_key_vault.main.id
}

resource "azurerm_role_assignment" "vm_kv_reader" {
  scope                = data.azurerm_key_vault.main.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = module.compute.vm_pricipal_id
}

# Modules
module "network" {
  source              = "./modules/network"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location

  project_name     = var.project_name
  address_space    = var.address_space
  address_prefixes = var.address_prefixes
  allowed_ip       = var.allowed_ip
}


module "compute" {
  source              = "./modules/compute"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  vm_size             = var.vm_size

  project_name          = var.project_name
  ssh_public_key        = data.azurerm_key_vault_secret.ssh.value
  network_interface_ids = module.network.vm_nic
  key_vault_name        = var.key_vault_name

  depends_on = [module.network]
}
