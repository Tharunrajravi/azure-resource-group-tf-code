output "vm_ids" {
  value = {
    for k, vm in azurerm_linux_virtual_machine.this :
    k => vm.id
  }
}

output "vm_names" {
  value = {
    for k, vm in azurerm_linux_virtual_machine.this :
    k => vm.name
  }
}

output "network_interface_ids" {
  value = {
    for k, nic in azurerm_network_interface.this :
    k => nic.id
  }
}

output "private_ip_addresses" {
  value = {
    for k, nic in azurerm_network_interface.this :
    k => nic.private_ip_address
  }
}

output "ip_configuration_name" {
  description = "NIC IP Configuration Name"

  value = var.ip_configuration_name
}