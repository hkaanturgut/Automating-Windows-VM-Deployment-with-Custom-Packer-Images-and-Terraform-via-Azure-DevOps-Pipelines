output "name" {
	description = "The Name of the Resource Group."
	value = azurerm_resource_group.resource_group.name
}

output "id" {
	description = "The ID of the Resource Group."
	value = azurerm_resource_group.resource_group.id
}

output "location" {
	description = "The Location of the Resource Group"
	value = azurerm_resource_group.resource_group.location
  
}