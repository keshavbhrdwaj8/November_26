
variable "app_service_plan_name" { type = string }
variable "resource_group_name" { type = string }
variable "location" { type = string }
variable "tags" { type = map(string) }

# Optional SKU override
variable "sku_name" {
  type        = string
  description = "App Service Plan SKU (e.g., B1, P1v3)"
  default     = "B1"
}
