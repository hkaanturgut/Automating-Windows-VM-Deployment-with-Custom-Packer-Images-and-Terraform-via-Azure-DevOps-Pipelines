output "id" {
    description = "The virtual NetworkConfiguration ID."
    value = azurerm_virtual_network.virtual_network.id  
}

output "name" {
    description = "The virtual Network Name"
    value = azurerm_virtual_network.virtual_network.name
  
}