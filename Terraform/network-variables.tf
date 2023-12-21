
##############################
## Network VNET - Variables ##
##############################
variable "network_vnet_cidr" {
  type        = string
  description = "The CIDR of the network VNET"
}

##############################
## Network SNET - Variables ##
##############################

variable "network_snet_address_prefixes" {
  type        = list(string)
  description = "The CIDR for the network subnet"
}
