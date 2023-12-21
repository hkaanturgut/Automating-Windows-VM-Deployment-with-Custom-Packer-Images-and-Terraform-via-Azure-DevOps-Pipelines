variable "location" {
  description = <<EOD
		(Required) The Azure Region where the Resource Group should exist.
		Changing this forces a new Resource Group to be created.
	EOD
  type        = string
}

variable "name" {
  description = <<EOD
		(Required) The Name which should be used for this Resource Group.
		Changing this forces a new Resource Group to be created.
	EOD
  type        = string
}

variable "tags" {
  description = <<EOD
		(Optional) A mapping of tags which should be assigned to the Resource Group.
	EOD
  default     = null
  type        = map(string)
}