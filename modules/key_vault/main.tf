
# Get current tenant from the logged-in context
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  purge_protection_enabled    = true
  soft_delete_retention_days  = 7
  enabled_for_deployment      = false
  enabled_for_disk_encryption = false
  enabled_for_template_deployment = false

  public_network_access_enabled = false

  network_acls {
    bypass         = "None"
    default_action = "Deny"
  }

  tags = var.tags
}
