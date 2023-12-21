variable "ip_configurations" {
  description = <<EOD
      (Required) One or more ip_configuration blocks as defined below.
      The ip_configuration block supports the following:
        - name - (Required) A name used for this IP Configuration.
        - subnet_id - (Optional) The ID of the Subnet where this Network Interface should be located in.
          NOTE: This is required when private_ip_address_version is set to IPv4.
        - private_ip_address_allocation - (Required) The allocation method used for the Private IP Address.
          Possible values are Dynamic and Static.
          NOTE: Dynamic means "An IP is automatically assigned during creation of this Network Interface"; Static means "User supplied IP address will be used"
        - private_ip_address - (Optional) The Static IP Address which should be used.
    EOD
  type = list(object({
    name                                               = string
    subnet_id                                          = optional(string)
    private_ip_address_allocation                      = string
    public_ip_address_id                                 = optional(string)
  }))
}

variable "location" {
  description = <<EOD
      (Required) The location where the Network Interface should exist.
      Changing this forces a new resource to be created.
    EOD
  type        = string
}

variable "name" {
  description = <<EOD
      (Required) The name of the Network Interface.
      Changing this forces a new resource to be created.
    EOD
  type        = string
}

variable "resource_group_name" {
  description = <<EOD
      (Required) The name of the Resource Group in which to create the Network Interface.
      Changing this forces a new resource to be created.
    EOD
  type        = string
}

variable "tags" {
  description = <<EOD
      (Optional) A mapping of tags to assign to the resource.
    EOD
  default     = null
  type        = map(string)
}