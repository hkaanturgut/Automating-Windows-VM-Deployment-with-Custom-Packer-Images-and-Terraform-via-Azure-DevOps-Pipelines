output "id" {
  description = "The ID of this Public IP."
  value       = azurerm_public_ip.public_ip.id
}

output "ip_address" {
  description = <<EOD
      The IP address value that was allocated.
      Note: Dynamic Public IP Addresses aren't allocated until they're attached to a device (e.g. a Virtual Machine/Load Balancer). 
      Instead you can obtain the IP Address once the Public IP has been assigned via the azurerm_public_ip Data Source.
    EOD
  value       = azurerm_public_ip.public_ip.ip_address
}