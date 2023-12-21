# Manages a Network Interface.
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface
resource "azurerm_network_interface" "network_interface" {

  dynamic "ip_configuration" {
    for_each = var.ip_configurations

    content {
      name                          = ip_configuration.value.name
      subnet_id                     = ip_configuration.value.subnet_id
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
      public_ip_address_id          = ip_configuration.value.public_ip_address_id
    }
  }

  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  tags                = var.tags
}