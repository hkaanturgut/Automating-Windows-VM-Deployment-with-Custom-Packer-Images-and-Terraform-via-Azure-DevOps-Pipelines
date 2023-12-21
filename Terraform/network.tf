####################
## Network - Main ##
####################

# Create a resource group for network
module "network_rg" {
  source   = "./modules/resource_group"
  location = var.location
  name     = "win-${lower(replace(var.app_name, " ", "-"))}-${var.environment}-rg"
  tags = {
    application = var.app_name
    environment = var.environment
  }
}

module "network_vnet" {
  source              = "./modules/virtual_network"
  name                = "win-${lower(replace(var.app_name, " ", "-"))}-${var.environment}-vnet"
  address_space       = [var.network_vnet_cidr]
  resource_group_name = module.network_rg.name
  location            = module.network_rg.location
  tags = {
    application = var.app_name
    environment = var.environment
  }

}


module "network_snet" {
  source               = "./modules/subnet"
  name                 = "win-${lower(replace(var.app_name, " ", "-"))}-${var.environment}-subnet"
  address_prefixes     = var.network_snet_address_prefixes
  virtual_network_name = module.network_vnet.name
  resource_group_name  = module.network_rg.name
}

#######################
## NSG SEC RULE ##
#######################
module "windows_vm_nsg_sec_rule" {
  source                      = "./modules/network_security_rule"
  name                        = var.windows_vm_nsg_sec_rule.name
  resource_group_name         = module.network_rg.name
  network_security_group_name = module.windows_vm_nsg.name
  protocol                    = var.windows_vm_nsg_sec_rule.protocol
  source_port_range           = var.windows_vm_nsg_sec_rule.source_port_range
  destination_port_range      = var.windows_vm_nsg_sec_rule.destination_port_range
  source_address_prefix       = var.windows_vm_nsg_sec_rule.source_address_prefix
  destination_address_prefix  = var.windows_vm_nsg_sec_rule.destination_address_prefix
  access                      = var.windows_vm_nsg_sec_rule.access
  priority                    = var.windows_vm_nsg_sec_rule.priority
  direction                   = var.windows_vm_nsg_sec_rule.direction

}


module "snet_nsg_association" {
  source                    = "./modules/subnet_network_security_group_association"
  subnet_id                 = module.network_snet.id
  network_security_group_id = module.windows_vm_nsg.id
}