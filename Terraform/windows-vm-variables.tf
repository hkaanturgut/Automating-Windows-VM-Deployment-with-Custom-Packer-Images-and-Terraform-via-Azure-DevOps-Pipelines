############################
## NSG RULE - Variables ##
############################

variable "windows_vm_nsg_sec_rule" {
  type = object({
    name = string
    protocol= string
    source_port_range= string
    destination_port_range= string
    source_address_prefix= string
    destination_address_prefix= string
    access= string
    priority= number
    direction= string
  })
}

############################
## WINDOWS VM HOSTNAME - Variables ##
############################
variable "windows-vm-hostname" {
  type = string
  
}

############################
## Public IP - Variables ##
############################

variable "pip_allocation_method" {
  type = string
}

############################
## NIC - Variables ##
############################

variable "nic_ip_configurations" {
  type = object({
    name = string
    private_ip_address_allocation= string
  })
  
}

############################
## Packer Image - Variables ##
############################

variable "packer_image" {
  type = object({
    name = string
  })
  
}

###########################
# Windows VM - Variables ##
###########################

variable "windows_vm" {
  type = object({
    name=string
    size = string
    admin_username= string
    admin_password=string
    //os_disk
    caching=string
    storage_account_type=string
    # tags=map(string)
  })
  
}

