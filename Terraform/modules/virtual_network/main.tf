# Manages a virtual network including any configured subnets. 
# Each subnet can optionally be configured with a security group to be associated with the subnet.
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network
resource "azurerm_virtual_network" "virtual_network" { 
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = var.tags
}