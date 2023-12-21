########################
## NSG ##
#######################
module "windows_vm_nsg" {
  source              = "./modules/network_security_group"
  name                = "${var.company}-${var.environment}-windows-vm-nsg"
  location            = module.network_rg.location
  resource_group_name = module.network_rg.name
  tags = {
    application = var.app_name
    environment = var.environment
  }

}


# Get a Static Public IP
module "pip" {
  source              = "./modules/public_ip"
  name                = "${var.windows-vm-hostname}-ip"
  location            = module.network_rg.location
  resource_group_name = module.network_rg.name
  allocation_method   = var.pip_allocation_method

  tags = {
    application = var.app_name
    environment = var.environment
  }

}
# Create a Network Interface Card for the Windows VM
module "nic" {
  source              = "./modules/network_interface"
  name                = "${var.windows-vm-hostname}-nic"
  location            = module.network_rg.location
  resource_group_name = module.network_rg.name
  tags = {
    application = var.app_name
    environment = var.environment
  }
  ip_configurations = [
    {
      name                          = var.nic_ip_configurations.name
      subnet_id                     = module.network_snet.id
      private_ip_address_allocation = var.nic_ip_configurations.private_ip_address_allocation
      public_ip_address_id            = module.pip.id
    }
  ]

}


# Create a resource group for Packer Image
module "packer_rg" {
  source   = "./modules/resource_group"
  location = var.location
  name     = "win-${lower(replace(var.app_name, " ", "-"))}-${var.environment}-packer-rg"
  tags = {
    application = var.app_name
    environment = var.environment
  }
}

# Packer Image Reference
data "azurerm_image" "packer_image" {
  name                = var.packer_image.name
  resource_group_name = module.packer_rg.name
}

# Output the Packer image ID or other attributes as needed
output "id" {
  value = data.azurerm_image.packer_image.id
}



######################
# Windows VM ##
######################

module "windows_vm" {
  source = "./modules/windows_virtual_machine"
  name                  = var.windows_vm.name
  location            = module.network_rg.location
  resource_group_name = module.network_rg.name
  size                  = var.windows_vm.size
  network_interface_ids = [module.nic.id]

  admin_username        = var.windows_vm.admin_username
  admin_password        = var.windows_vm.admin_password

  os_disk = {
    name                 = "${var.windows-vm-hostname}-os-disk"
    caching              = var.windows_vm.caching
    storage_account_type = var.windows_vm.storage_account_type
  }

  source_image_id = data.azurerm_image.packer_image.id

  tags = {
    application = var.app_name
    environment = var.environment 
  }
}

