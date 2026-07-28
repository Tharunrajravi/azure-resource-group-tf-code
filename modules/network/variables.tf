variable "resource_group_name" {
  description = "Name of the existing Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region where networking resources will be deployed"
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "subnet_prefixes" {
  description = "Address prefixes for the subnet"
  type        = list(string)
}

variable "network_security_group_name" {
  description = "Name of the Network Security Group"
  type        = string
}

variable "tags" {
  description = "Tags applied to networking resources"
  type        = map(string)
  default     = {}
}

variable "security_rules" {
  description = "List of NSG security rules"

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

  default = []
}