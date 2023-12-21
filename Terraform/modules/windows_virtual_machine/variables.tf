variable "name" {
  description = <<EOD
      (Required) The name of the Windows Virtual Machine. 
      Changing this forces a new resource to be created.
    EOD
  type        = string
}

variable "resource_group_name" {
  description = <<EOD
      (Required) The name of the Resource Group in which the Windows Virtual Machine should be exist. 
      Changing this forces a new resource to be created.
    EOD
  type        = string
}

variable "location" {
  description = <<EOD
      (Required) The Azure location where the Windows Virtual Machine should exist. 
      Changing this forces a new resource to be created.
    EOD
  type        = string
}

variable "size" {
  description = <<EOD
      (Required) The SKU which should be used for this Virtual Machine, such as Standard_F2.
    EOD
  type        = string
}

variable "admin_username" {
  description = <<EOD
      (Required) The username of the local administrator used for the Virtual Machine. 
      Changing this forces a new resource to be created.
    EOD
  type        = string
}

variable "admin_password" {
  description = <<EOD
      (Required) The Password which should be used for the local-administrator on this Virtual Machine. 
      Changing this forces a new resource to be created.
    EOD
  type        = string
}

variable "network_interface_ids" {
  description = <<EOD
      (Required). A list of Network Interface IDs which should be attached to this Virtual Machine. 
      The first Network Interface ID in this list will be the Primary Network Interface on the Virtual Machine.
    EOD
  type        = list(string)
}

variable "os_disk" {
  description = <<EOD
      (Required) A os_disk block as defined below.
        - caching - (Required) The Type of Caching which should be used for the Internal OS Disk. 
        Possible values are None, ReadOnly and ReadWrite.
        - (Required) The Type of Storage Account which should back this the Internal OS Disk. 
        Possible values are Standard_LRS, StandardSSD_LRS, Premium_LRS, StandardSSD_ZRS and Premium_ZRS. 
        Changing this forces a new resource to be created.
    EOD
  type = object({
    name = string
    caching              = string
    storage_account_type = string
  })
}

variable "source_image_id" {
  description = <<EOD
      (Optional) The ID of the Image which this Virtual Machine should be created from. 
      Changing this forces a new resource to be created. Possible Image ID types include Image IDs, Shared Image IDs, 
      Shared Image Version IDs, Community Gallery Image IDs, Community Gallery Image Version IDs, 
      Shared Gallery Image IDs and Shared Gallery Image Version IDs.
    EOD
  default     = null
  type        = string
}

variable "source_image_reference" {
  description = <<EOD
      (Optional) A source_image_reference block as defined below. 
      Changing this forces a new resource to be created.
        - publisher - (Required) Specifies the publisher of the image used to create the virtual machines. 
        Changing this forces a new resource to be created.
        - offer - (Required) Specifies the offer of the image used to create the virtual machines. 
        Changing this forces a new resource to be created.
        - sku - (Required) Specifies the SKU of the image used to create the virtual machines. 
        Changing this forces a new resource to be created.
        sku - (Required) Specifies the SKU of the image used to create the virtual machines. 
        Changing this forces a new resource to be created.
    EOD
  default     = null
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}

variable "identity" {
  description = <<EOD
      (Optional) An identity block as defined below.
        - type - (Required) Specifies the type of Managed Service Identity 
        that should be configured on this Windows Virtual Machine. 
        Possible values are SystemAssigned, UserAssigned, SystemAssigned, UserAssigned (to enable both).
        - identity_ids - (Optional) Specifies a list of User Assigned Managed Identity IDs to be assigned to this Windows Virtual Machine.
    EOD
  default     = null
  type = object({
    type         = string
    identity_ids = optional(list(string))
  })
}

variable "patch_assessment_mode" {
  description = <<EOD
      (Optional) Specifies the mode of VM Guest Patching for the Virtual Machine. 
      Possible values are AutomaticByPlatform or ImageDefault. Defaults to ImageDefault.
    EOD
  default     = null
  type        = string
}

variable "boot_diagnostics" {
  description = <<EOD
      (Optional) A boot_diagnostics block. 
      Passing a null value will utilize a Managed Storage Account to store Boot Diagnostics.
    EOD
  default     = null
  type        = string
}

variable "license_type" {
  description = <<EOD
      (Optional) Specifies the type of on-premise license (also known as Azure Hybrid Use Benefit) 
      which should be used for this Virtual Machine. 
      Possible values are None, Windows_Client and Windows_Server.
    EOD
  default     = null
  type        = string
}

variable "zone" {
  description = <<EOD
      (Optional) Specifies the Availability Zone in which this Windows Virtual Machine should be located. 
      Changing this forces a new Windows Virtual Machine to be created.
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