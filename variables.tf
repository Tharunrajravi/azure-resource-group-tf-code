variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "virtual_network_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "subnet_name" {
  type = string
}

variable "subnet_prefixes" {
  type = list(string)
}

variable "network_security_group_name" {
  type = string
}

variable "security_rules" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}

variable "virtual_machines" {
  type = map(object({
    size              = string
    admin_username    = string
    zone              = optional(string)
    public_ip_enabled = bool
    os_disk_type      = string
  }))
}

variable "image" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}

variable "admin_ssh_public_key" {
  type = string
}

variable "ip_configuration_name" {
  type    = string
  default = "primary"
}

variable "load_balancer_name" {
  type = string
}

variable "load_balancer_public_ip_name" {
  type = string
}

variable "frontend_ip_configuration_name" {
  type = string
}

variable "backend_pool_name" {
  type = string
}

variable "probe_name" {
  type = string
}

variable "probe_port" {
  type = number
}

variable "load_balancing_rule_name" {
  type = string
}

variable "frontend_port" {
  type = number
}

variable "backend_port" {
  type = number
}

variable "protocol" {
  type = string
}

variable "tags" {
  type = map(string)
}