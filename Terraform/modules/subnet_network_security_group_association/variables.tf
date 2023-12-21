variable "network_security_group_id" {
  description = <<EOD
	  (Required) The ID of the Network Security Group which should be associated with the Subnet.
	  Changing this forces a new resource to be created.
	EOD
  type        = string
}

variable "subnet_id" {
  description = <<EOD
	  (Required) The ID of the Subnet.
	  Changing this forces a new resource to be created.
	EOD
  type        = string
}