variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "load_balancer_name" {
  description = "Load Balancer Name"
  type        = string
}

variable "public_ip_name" {
  description = "Public IP Name"
  type        = string
}

variable "frontend_ip_configuration_name" {
  description = "Frontend IP Configuration Name"
  type        = string
}

variable "backend_pool_name" {
  description = "Backend Pool Name"
  type        = string
}

variable "probe_name" {
  description = "Health Probe Name"
  type        = string
}

variable "probe_port" {
  description = "Health Probe Port"
  type        = number
  default     = 80
}

variable "load_balancing_rule_name" {
  description = "Load Balancing Rule Name"
  type        = string
}

variable "frontend_port" {
  type    = number
  default = 80
}

variable "backend_port" {
  type    = number
  default = 80
}

variable "protocol" {
  type    = string
  default = "Tcp"
}

variable "network_interface_ids" {
  description = "NIC IDs from Compute Module"
  type        = map(string)
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "ip_configuration_name" {
  description = "NIC IP Configuration Name"

  type = string
}