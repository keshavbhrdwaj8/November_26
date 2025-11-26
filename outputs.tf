
output "storage_account_id" {
  value       = module.storage_account.id
  description = "Resource ID of the Storage Account"
}

output "key_vault_id" {
  value       = module.key_vault.id
  description = "Resource ID of the Key Vault"
}

output "app_service_plan_id" {
  value       = module.app_service_plan.id
  description = "Resource ID of the App Service Plan"
}

output "web_app_id" {
  value       = module.web_app.id
  description = "Resource ID of the Web App"
}

output "web_app_default_hostname" {
  value       = module.web_app.default_hostname
  description = "Default hostname of the Web App"
}
