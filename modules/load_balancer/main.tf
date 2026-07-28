resource "azurerm_public_ip" "this" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"

  tags = var.tags
}

resource "azurerm_lb" "this" {
  name                = var.load_balancer_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.this.id
  }

  tags = var.tags
}

resource "azurerm_lb_backend_address_pool" "this" {
  loadbalancer_id = azurerm_lb.this.id
  name            = var.backend_pool_name
}

resource "azurerm_lb_probe" "this" {
  loadbalancer_id = azurerm_lb.this.id

  name     = var.probe_name
  protocol = var.protocol
  port     = var.probe_port
}

resource "azurerm_lb_rule" "this" {
  loadbalancer_id = azurerm_lb.this.id

  name = var.load_balancing_rule_name

  protocol      = var.protocol
  frontend_port = var.frontend_port
  backend_port  = var.backend_port

  frontend_ip_configuration_name = var.frontend_ip_configuration_name

  backend_address_pool_ids = [
    azurerm_lb_backend_address_pool.this.id
  ]

  probe_id = azurerm_lb_probe.this.id
}

resource "azurerm_network_interface_backend_address_pool_association" "this" {

  for_each = var.network_interface_ids

  network_interface_id    = each.value

  ip_configuration_name   = "var.ip_configuration_name"

  backend_address_pool_id = azurerm_lb_backend_address_pool.this.id
}