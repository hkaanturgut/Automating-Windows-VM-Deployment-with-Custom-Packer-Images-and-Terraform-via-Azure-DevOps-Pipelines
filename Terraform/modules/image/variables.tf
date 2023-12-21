variable "name" {
  description = <<EOD
      (Required) Specifies the name of the image. 
      Changing this forces a new resource to be created.
    EOD
  type        = string
}

variable "resource_group_name" {
  description = <<EOD
      (Required) The name of the resource group in which to create. 
      Changing this forces a new resource to be created. the image. 
      Changing this forces a new resource to be created.
    EOD
  type        = string
}

variable "location" {
  description = <<EOD
      (Required) Specified the supported Azure location where the resource exists. 
      Changing this forces a new resource to be created. 
    EOD
  type        = string
}

variable "source_virtual_machine_id" {
  description = <<EOD
      (Optional) The Virtual Machine ID from which to create the image.
    EOD
  default     = null
  type        = string
}

variable "os_disks" {
  description = <<EOD
      (Optional) One or more os_disk blocks as defined below. 
      Changing this forces a new resource to be created.
        - os_type - (Optional) Specifies the type of operating system 
        contained in the virtual machine image. Possible values are: Windows or Linux.
        - os_state - (Optional) Specifies the state of the operating system contained in the blob. 
        Currently, the only value is Generalized. Possible values are Generalized and Specialized.
        - managed_disk_id - (Optional) Specifies the ID of the managed disk resource that you want to use to create the image.
        - caching - (Optional) Specifies the caching mode as ReadWrite, ReadOnly, or None. The default is None.
        - size_gb - (Optional) Specifies the size of the image to be created. Changing this forces a new resource to be created.
    EOD
  default     = {}
  type = list(object({
    os_type         = optional(string)
    os_state        = optional(string)
    managed_disk_id = optional(string)
    caching         = optional(string)
    size_gb         = optional(number)
  }))
}

variable "zone_resilient" {
  description = <<EOD
      (Optional) Is zone resiliency enabled? Defaults to false. 
      Changing this forces a new resource to be created.
    EOD
  default     = null
  type        = bool
}

variable "hyper_v_generation" {
  description = <<EOD
      (Optional) The HyperVGenerationType of the VirtualMachine created from the image as V1, V2. Defaults to V1. 
      Changing this forces a new resource to be created.
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