variable "name" {
  description = <<EOD
	  (Required) The name of the security rule.
	  This needs to be unique across all Rules in the Network Security Group.
	  Changing this forces a new resource to be created.
	EOD
  type        = string
}

variable "resource_group_name" {
  description = <<EOD
	  (Required) The name of the resource group in which to create the Network Security Rule.
	  Changing this forces a new resource to be created.
	EOD
  type        = string
}

variable "network_security_group_name" {
  description = <<EOD
	  (Required) The name of the Network Security Group that we want to attach the rule to.
	  Changing this forces a new resource to be created.
	EOD
  type        = string
}

variable "protocol" {
  description = <<EOD
	  (Required) Network protocol this rule applies to.
	  Possible values include Tcp, Udp, Icmp, Esp, Ah or * (which matches all).
	EOD
  type        = string
}

variable "source_port_range" {
  description = <<EOD
	  (Optional) Source Port or Range.
	  Integer or range between 0 and 65535 or * to match any.
	  This is required if source_port_ranges is not specified.
	EOD
  default     = null
  type        = string
}

variable "destination_port_range" {
  description = <<EOD
	  (Optional) Destination Port or Range.
	  Integer or range between 0 and 65535 or * to match any.
	  This is required if destination_port_ranges is not specified.
	EOD
  default     = null
  type        = string
}

variable "destination_port_ranges" {
  description = <<EOD
	  (Optional) List of destination ports or port ranges.
	  This is required if destination_port_range is not specified.
	EOD
  default     = null
  type        = list(string)
}

variable "source_address_prefix" {
  description = <<EOD
	  (Optional) CIDR or source IP range or * to match any IP.
	  Tags such as VirtualNetwork, AzureLoadBalancer and Internet can also be used.
	  This is required if source_address_prefixes is not specified.
	EOD
  default     = null
  type        = string
}

variable "source_address_prefixes" {
  description = <<EOD
	  (Optional) List of source address prefixes.
	  Tags may not be used.
	  This is required if source_address_prefix is not specified.
	EOD
  default     = null
  type        = set(string)
}

variable "destination_address_prefix" {
  description = <<EOD
	  (Optional) CIDR or destination IP range or * to match any IP.
	  Tags such as VirtualNetwork, AzureLoadBalancer and Internet can also be used.
	  Besides, it also supports all available Service Tags like 'Sql.WestEurope', 'Storage.EastUS', etc.
	  You can list the available service tags with the CLI: shell az network list-service-tags --location westcentralus. For further information please see https://docs.microsoft.com/cli/azure/network?view=azure-cli-latest#az-network-list-service-tags.
	  This is required if destination_address_prefixes is not specified.
	EOD
  default     = null
  type        = string
}

variable "access" {
  description = <<EOD
	  (Required) Specifies whether network traffic is allowed or denied.
	  Possible values are Allow and Deny.
	EOD
  type        = string
}

variable "priority" {
  description = <<EOD
	  (Required) Specifies the priority of the rule.
	  The value can be between 100 and 4096.
	  The priority number must be unique for each rule in the collection.
	  The lower the priority number, the higher the priority of the rule.
	EOD
  type        = number
}

variable "direction" {
  description = <<EOD
	  (Required) The direction specifies if rule will be evaluated on incoming or outgoing traffic.
	  Possible values are Inbound and Outbound.
	EOD
  type        = string
}