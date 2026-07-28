variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID where NICs will be created"
  type        = string
}

variable "virtual_machines" {
  description = "Map of Linux Virtual Machines"

  type = map(object({
    size              = string
    admin_username    = string
    zone              = optional(string)
    public_ip_enabled = bool
    os_disk_type = string
  }))
}

variable "admin_ssh_public_key" {
  description = "SSH Public Key"

  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "image" {
  description = "Source image reference for the virtual machines"

  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}

variable "ip_configuration_name" {
  description = "Network Interface IP Configuration Name"
  type        = string
  default     = "primary"
}