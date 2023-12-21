# Manages a custom virtual machine image that can be used to create virtual machines.
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/image
resource "azurerm_image" "image" {
  name                      = var.name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  source_virtual_machine_id = var.source_virtual_machine_id

  dynamic "os_disk" {
    for_each = var.os_disks

    content {
      os_type         = os_disk.value.os_type
      os_state        = os_disk.value.os_state
      managed_disk_id = os_disk.value.managed_disk_id
      caching         = os_disk.value.caching
      size_gb         = os_disk.value.size_gb
    }
  }

  zone_resilient     = var.zone_resilient
  hyper_v_generation = var.hyper_v_generation
  tags               = var.tags
}