output "id" {
  description = "The ID of the Network Security Group."
  value = azurerm_network_security_group.network_security_group.id
}

output "name" {
  description = "The NAME of the Network Security Group"
  value = azurerm_network_security_group.network_security_group.name
}