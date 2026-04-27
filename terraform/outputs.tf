# Network
output "vm_pub_ip" {
  value = module.network.vm_pub_ip
}

output "vm_pvt_ip" {
  value = module.compute.vm_pvt_ip
}

output "vm_vnet_id" {
  value = module.network.vm_vnet_id
}

output "vm_vnet_name" {
  value = module.network.vm_vnet_name
}

# VM
output "vm_username" {
  value = "adminuser"
}

output "vm_id" {
  value = module.compute.vm_id
}

# Project
output "project_name" {
  value = var.project_name
}
