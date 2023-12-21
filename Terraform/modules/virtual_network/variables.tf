variable "name" {
  description = <<EOD
      (Required) The name of the virtual network. 
      Changing this forces a new resource to be created.
  EOD
  type        = string
}

variable "location" {
  description = <<EOD
      (Required) The location/region where the virtual network is created. 
      Changing this forces a new resource to be created.
  EOD
  type        = string
}

variable "resource_group_name" {
  description = <<EOD
      (Required) The name of the resource group in which to create the virtual network. 
      Changing this forces a new resource to be created.
  EOD
  type        = string
}

variable "address_space" {
  description = <<EOD
      (Required) The address space that is used the virtual network. 
      You can supply more than one address space.
  EOD
  type        = list(string)
}

variable "tags" {
  description = <<EOD
      (Optional) A mapping of tags to assign to the resource.
  EOD
  default     = null
  type        = map(string)
}