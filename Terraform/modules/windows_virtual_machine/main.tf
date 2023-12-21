# Manages a Windows Virtual Machine.
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine
resource "azurerm_windows_virtual_machine" "windows_virtual_machine" {
  name                  = var.name
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = var.network_interface_ids

  os_disk {
    name = var.os_disk.name
    caching              = var.os_disk.caching
    storage_account_type = var.os_disk.storage_account_type
  }

  source_image_id = var.source_image_id

  # dynamic "source_image_reference" {
  #   for_each = var.source_image_reference != null ? [1] : []

  #   content {
  #     publisher = var.source_image_reference.publisher
  #     offer     = var.source_image_reference.offer
  #     sku       = var.source_image_reference.sku
  #     version   = var.source_image_reference.version
  #   }
  # }

  # dynamic "identity" {
  #   for_each = var.identity != null ? [1] : []

  #   content {
  #     type         = var.identity.type
  #     identity_ids = var.identity.identity_ids
  #   }
  # }

  # patch_assessment_mode = var.patch_assessment_mode

  # dynamic "boot_diagnostics" {
  #   for_each = var.boot_diagnostics != null ? [1] : []

  #   content {}
  # }

  # license_type = var.license_type
  # zone         = var.zone
  tags         = var.tags
}