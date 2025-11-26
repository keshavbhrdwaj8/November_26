
resource "azurerm_linux_web_app" "this" {
  name                = var.web_app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id
  https_only          = true

  identity {
    type = "SystemAssigned"
  }

  site_config {
    ftps_state   = "Disabled"
    minimum_tls_version = "1.2"
    always_on    = true
    app_command_line = ""
  }

  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
  }

  tags = var.tags
}
