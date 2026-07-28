output "load_balancer_id" {
  value = azurerm_lb.this.id
}

output "load_balancer_name" {
  value = azurerm_lb.this.name
}

output "public_ip_address" {
  value = azurerm_public_ip.this.ip_address
}

output "backend_pool_id" {
  value = azurerm_lb_backend_address_pool.this.id
}