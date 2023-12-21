####################
# Common Variables #
####################
company     = "kaant-academy"
app_name    = "kaan-demo"
environment = "development"
location    = "canadacentral"

###########
# VNET #
###########
network_vnet_cidr = "10.128.0.0/16"

###########
# SNET #
###########
network_snet_address_prefixes = ["10.128.1.0/24"]


###########
# NSG RULE #
###########
windows_vm_nsg_sec_rule={
    name = "AllowRDP"
    protocol= "Tcp"
    source_port_range= "*"
    destination_port_range= "3389"
    source_address_prefix= "Internet"
    destination_address_prefix= "*"
    access= "Allow"
    priority= 100
    direction= "Inbound"
}



###########
# PIP #
###########
pip_allocation_method = "Static"

###########
# NIC #
###########
nic_ip_configurations={
    name="internal"
    private_ip_address_allocation="Dynamic"
}

############################
## Packer Image ##
############################
packer_image={
    name="KaanT-Packer-Image"
}

##############
# Windows VM #
##############
windows_vm={
    name="KaanT-Packer-VM"
    size="Standard_DS1_v2"
    admin_username="username"
    admin_password = "password"
    caching="ReadWrite"
    storage_account_type="Standard_LRS"

}

############################
## WINDOWS VM HOSTNAME - Variables ##
############################
 windows-vm-hostname= "tfwinsrv"

  
