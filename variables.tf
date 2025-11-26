
variable "resource_group_name" {
  description = "Name of the existing resource group to deploy into"
  type        = string
}

variable "location" {
  description = "Azure region (e.g., eastus, centralindia)"
  type        = string
}

variable "tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default     = {
    environment = "lab"
    workload    = "landing-zone"
  }
}

variable "storage_account_name" {
  description = "Name for the Storage Account (must be globally unique, 3-24 lowercase letters and numbers)"
  type        = string
}

variable "key_vault_name" {
  description = "Name for the Key Vault"
  type        = string
}

variable "app_service_plan_name" {
  description = "Name for the App Service Plan"
  type        = string
}

variable "web_app_name" {
  description = "Name for the Web App"
  type        = string
}
