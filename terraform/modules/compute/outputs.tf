output "vm_id" {
  value = azurerm_linux_virtual_machine.main.id
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.main.name
}

output "vm_pub_ip" {
  value = azurerm_linux_virtual_machine.main.public_ip_address
}

output "vm_pvt_ip" {
  value = azurerm_linux_virtual_machine.main.private_ip_address
}

output "vm_pricipal_id" {
  value = azurerm_linux_virtual_machine.main.identity[0].principal_id
}
