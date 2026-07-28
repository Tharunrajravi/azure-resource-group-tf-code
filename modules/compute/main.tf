resource "azurerm_public_ip" "this" {
  for_each = {
    for k, v in var.virtual_machines :
    k => v if v.public_ip_enabled
  }

  name                = "${each.key}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"

  tags = var.tags
}

resource "azurerm_network_interface" "this" {
  for_each = var.virtual_machines

  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "var.ip_configuration_name"
    subnet_id                     = var.subnet_id

    private_ip_address_allocation = "Dynamic"

    public_ip_address_id = try(
      azurerm_public_ip.this[each.key].id,
      null
    )
  }

  tags = var.tags
}


resource "azurerm_linux_virtual_machine" "this" {
  for_each = var.virtual_machines

  name                = each.key

  resource_group_name = var.resource_group_name
  location            = var.location

  size = each.value.size

  admin_username = each.value.admin_username

  network_interface_ids = [
    azurerm_network_interface.this[each.key].id
  ]

  disable_password_authentication = true

  zone = try(each.value.zone, null)

  admin_ssh_key {
    username   = each.value.admin_username
    public_key = var.admin_ssh_public_key
  }

  os_disk {

    caching              = "ReadWrite"

    storage_account_type = "each.value.os_disk_type"

  }

  source_image_reference {
  publisher = var.image.publisher
  offer     = var.image.offer
  sku       = var.image.sku
  version   = var.image.version
}

  boot_diagnostics {}

  tags = var.tags
}