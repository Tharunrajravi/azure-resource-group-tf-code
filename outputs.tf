output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "virtual_network_id" {
  value = module.network.virtual_network_id
}

output "subnet_id" {
  value = module.network.subnet_id
}

output "vm_ids" {
  value = module.compute.vm_ids
}

output "private_ip_addresses" {
  value = module.compute.private_ip_addresses
}

output "load_balancer_public_ip" {
  value = module.load_balancer.public_ip_address
}