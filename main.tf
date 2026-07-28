module "resource_group" {
  source = "./modules/resource_group"

  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

module "network" {
  source = "./modules/network"

  resource_group_name         = module.resource_group.resource_group_name
  location                    = module.resource_group.location

  virtual_network_name        = var.virtual_network_name
  address_space               = var.address_space

  subnet_name                 = var.subnet_name
  subnet_prefixes             = var.subnet_prefixes

  network_security_group_name = var.network_security_group_name

  security_rules              = var.security_rules

  tags = var.tags
}

module "compute" {
  source = "./modules/compute"

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location

  subnet_id = module.network.subnet_id

  virtual_machines    = var.virtual_machines

  image               = var.image

  admin_ssh_public_key = var.admin_ssh_public_key

  ip_configuration_name = var.ip_configuration_name

  tags = var.tags
}

module "load_balancer" {
  source = "./modules/load_balancer"

  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location

  load_balancer_name              = var.load_balancer_name
  public_ip_name                  = var.load_balancer_public_ip_name

  frontend_ip_configuration_name  = var.frontend_ip_configuration_name

  backend_pool_name               = var.backend_pool_name

  probe_name                      = var.probe_name
  probe_port                      = var.probe_port

  load_balancing_rule_name        = var.load_balancing_rule_name

  frontend_port                   = var.frontend_port
  backend_port                    = var.backend_port
  protocol                        = var.protocol

  network_interface_ids           = module.compute.network_interface_ids

  ip_configuration_name           = module.compute.ip_configuration_name

  tags = var.tags
}