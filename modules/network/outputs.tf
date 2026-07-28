output "virtual_network_id" {
  description = "ID of the Virtual Network"
  value       = azurerm_virtual_network.this.id
}

output "virtual_network_name" {
  description = "Name of the Virtual Network"
  value       = azurerm_virtual_network.this.name
}

output "subnet_id" {
  description = "ID of the Subnet"
  value       = azurerm_subnet.this.id
}

output "subnet_name" {
  description = "Name of the Subnet"
  value       = azurerm_subnet.this.name
}

output "network_security_group_id" {
  description = "ID of the Network Security Group"
  value       = azurerm_network_security_group.this.id
}

output "network_security_group_name" {
  description = "Name of the Network Security Group"
  value       = azurerm_network_security_group.this.name
}