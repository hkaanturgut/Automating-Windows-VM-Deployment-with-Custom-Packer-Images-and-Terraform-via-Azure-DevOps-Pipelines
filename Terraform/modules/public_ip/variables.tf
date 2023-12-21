variable "name" {
  description = <<EOD
	  (Required) Specifies the name of the Public IP.
	  Changing this forces a new Public IP to be created.
	EOD
  type        = string
}

variable "resource_group_name" {
  description = <<EOD
	  (Required) The name of the Resource Group where this Public IP should exist.
	  Changing this forces a new Public IP to be created.
	EOD
  type        = string
}

variable "location" {
  description = <<EOD
	  (Required) Specifies the supported Azure location where the Public IP should exist.
	  Changing this forces a new resource to be created.
	EOD
  type        = string
}

variable "allocation_method" {
  description = <<EOD
	  (Required) Defines the allocation method for this IP address.
	  Possible values are Static or Dynamic.
	  Note: Dynamic Public IP Addresses aren't allocated until they're assigned to a resource (such as a Virtual Machine or a Load Balancer) by design within Azure. See ip_address argument.
	EOD
  type        = string
}

variable "sku" {
  description = <<EOD
	  (Optional) The SKU of the Public IP.
	  Accepted values are Basic and Standard.
	  Defaults to Basic.
	  Changing this forces a new resource to be created.
	  Note: Public IP Standard SKUs require allocation_method to be set to Static.
	EOD
  default     = null
  type        = string
}

variable "domain_name_label" {
  description = <<EOD
	  (Optional) Label for the Domain Name. Will be used to make up the FQDN. 
	  If a domain name label is specified, an A DNS record is created for 
	  the public IP in the Microsoft Azure DNS system.
	EOD
  default     = null
  type        = string
}

variable "tags" {
  description = <<EOD
	  (Optional) A mapping of tags to assign to the resource.
	EOD
  default     = null
  type        = map(string)
}