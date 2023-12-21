# Associates a Network Security Group with a Subnet within a Virtual Network.
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association
resource "azurerm_subnet_network_security_group_association" "subnet_network_security_group_association" {
  network_security_group_id = var.network_security_group_id
  subnet_id                 = var.subnet_id
}