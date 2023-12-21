variable "name" {
  description = <<EOD
		(Required) The name of the subnet.
		Changing this forces a new resource to be created.
	EOD
  type        = string
}

variable "resource_group_name" {
  description = <<EOD
		(Required) The name of the resource group in which to create the subnet.
		Changing this forces a new resource to be created.
	EOD
  type        = string
}

variable "virtual_network_name" {
  description = <<EOD
		(Required) The name of the virtual network to which to attach the subnet.
		Changing this forces a new resource to be created.
	EOD
  type        = string
}

variable "address_prefixes" {
  description = <<EOD
		(Required) The address prefixes to use for the subnet.
		NOTE: Currently only a single address prefix can be set as the Multiple Subnet Address Prefixes Feature is not yet in public preview or general availability.
	EOD
  type        = list(string)
}

variable "delegations" {
  description = <<EOD
		(Optional) One or more delegation blocks as defined below.
		A delegation block supports the following:
		- name - (Required) A name for this delegation.
		- service_delegation - (Required) A service_delegation block as defined below.
			A service_delegation block supports the following:
			NOTE: Delegating to services may not be available in all regions. Check that the service you are delegating to is available in your region using the Azure CLI as described at https://docs.microsoft.com/cli/azure/network/vnet/subnet?view=azure-cli-latest#az-network-vnet-subnet-list-available-delegations. Also, actions is specific to each service type. The exact list of actions needs to be retrieved using the aforementioned Azure CLI.
			- name - (Required) The name of service to delegate to. Possible values are GitHub.Network/networkSettings, Microsoft.ApiManagement/service, Microsoft.Apollo/npu, Microsoft.App/environments, Microsoft.App/testClients, Microsoft.AVS/PrivateClouds, Microsoft.AzureCosmosDB/clusters, Microsoft.BareMetal/AzureHostedService, Microsoft.BareMetal/AzureHPC, Microsoft.BareMetal/AzurePaymentHSM, Microsoft.BareMetal/AzureVMware, Microsoft.BareMetal/CrayServers, Microsoft.BareMetal/MonitoringServers, Microsoft.Batch/batchAccounts, Microsoft.CloudTest/hostedpools, Microsoft.CloudTest/images, Microsoft.CloudTest/pools, Microsoft.Codespaces/plans, Microsoft.ContainerInstance/containerGroups, Microsoft.ContainerService/managedClusters, Microsoft.ContainerService/TestClients, Microsoft.Databricks/workspaces, Microsoft.DBforMySQL/flexibleServers, Microsoft.DBforMySQL/servers, Microsoft.DBforMySQL/serversv2, Microsoft.DBforPostgreSQL/flexibleServers, Microsoft.DBforPostgreSQL/serversv2, Microsoft.DBforPostgreSQL/singleServers, Microsoft.DelegatedNetwork/controller, Microsoft.DevCenter/networkConnection, Microsoft.DocumentDB/cassandraClusters, Microsoft.Fidalgo/networkSettings, Microsoft.HardwareSecurityModules/dedicatedHSMs, Microsoft.Kusto/clusters, Microsoft.LabServices/labplans, Microsoft.Logic/integrationServiceEnvironments, Microsoft.MachineLearningServices/workspaces, Microsoft.Netapp/volumes, Microsoft.Network/dnsResolvers, Microsoft.Network/fpgaNetworkInterfaces, Microsoft.Network/networkWatchers., Microsoft.Network/virtualNetworkGateways, Microsoft.Orbital/orbitalGateways, Microsoft.PowerPlatform/enterprisePolicies, Microsoft.PowerPlatform/vnetaccesslinks, Microsoft.ServiceFabricMesh/networks, Microsoft.ServiceNetworking/trafficControllers, Microsoft.Singularity/accounts/networks, Microsoft.Singularity/accounts/npu, Microsoft.Sql/managedInstances, Microsoft.Sql/managedInstancesOnebox, Microsoft.Sql/managedInstancesStage, Microsoft.Sql/managedInstancesTest, Microsoft.StoragePool/diskPools, Microsoft.StreamAnalytics/streamingJobs, Microsoft.Synapse/workspaces, Microsoft.Web/hostingEnvironments, Microsoft.Web/serverFarms, NGINX.NGINXPLUS/nginxDeployments, PaloAltoNetworks.Cloudngfw/firewalls, and Qumulo.Storage/fileSystems.
			- actions - (Optional) A list of Actions which should be delegated. This list is specific to the service to delegate to. Possible values are Microsoft.Network/networkinterfaces/*, Microsoft.Network/publicIPAddresses/join/action, Microsoft.Network/publicIPAddresses/read, Microsoft.Network/virtualNetworks/read, Microsoft.Network/virtualNetworks/subnets/action, Microsoft.Network/virtualNetworks/subnets/join/action, Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action, and Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action.
				NOTE: Azure may add default actions depending on the service delegation name and they can't be changed.
	EOD
  default     = {}
  type = map(object({
    name = string
    service_delegation = object({
      name    = string
      actions = optional(list(string))
    })
  }))
}

variable "private_endpoint_network_policies_enabled" {
  description = <<EOD
		(Optional) Enable or Disable network policies for the private endpoint on the subnet.
		Setting this to true will Enable the policy and setting this to false will Disable the policy.
		Defaults to true.
		NOTE: Network policies, like network security groups (NSG), are not supported for Private Link Endpoints or Private Link Services. In order to deploy a Private Link Endpoint on a given subnet, you must set the private_endpoint_network_policies_enabled attribute to false. This setting is only applicable for the Private Link Endpoint, for all other resources in the subnet access is controlled based via the Network Security Group which can be configured using the azurerm_subnet_network_security_group_association resource.
	EOD
  default     = null
  type        = bool
}

variable "service_endpoints" {
  description = <<EOD
		(Optional) The list of Service endpoints to associate with the subnet.
		Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.ContainerRegistry, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage, Microsoft.Storage.Global and Microsoft.Web.
		NOTE: In order to use Microsoft.Storage.Global service endpoint (which allows access to virtual networks in other regions), you must enable the AllowGlobalTagsForStorage feature in your subscription. This is currently a preview feature, please see the official documentation for more information.
	EOD
  default     = null
  type        = set(string)
}