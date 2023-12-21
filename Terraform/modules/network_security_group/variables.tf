variable "name" {
  description = <<EOD
      (Required) Specifies the name of the network security group.
      Changing this forces a new resource to be created.
    EOD
  type        = string
}

variable "resource_group_name" {
  description = <<EOD
      (Required) Specifies the supported Azure location where the resource exists.
      Changing this forces a new resource to be created.
    EOD
  type        = string
}

variable "location" {
  description = <<EOD
      (Required) The name of the resource group in which to create the network security group.
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