resource "azurerm_linux_virtual_machine" "main" {
  name                = "${var.project_name}-vm"
  admin_username      = "adminuser"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size

  disable_password_authentication = true
  network_interface_ids           = var.network_interface_ids

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  admin_ssh_key {
    username   = "adminuser"
    public_key = var.ssh_public_key
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  identity {
    type = "SystemAssigned"
  }

  custom_data = base64encode(templatefile("${path.module}/cloud-init.yml", {
    key_vault_name = var.key_vault_name
    location       = var.location
    project_name   = var.project_name
  }))

  tags = {
    project_name = var.project_name
  }
}

