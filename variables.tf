
variable "resource_group_name" {
  default = "Keshav_Bhardwaj_RG"
  type        = string
}

variable "location" {
  default = "eastus"
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
  default = "keshavlab1storage"
  type        = string
}

variable "key_vault_name" {
  default = "keshavlab1-kv"
  type        = string
}

variable "app_service_plan_name" {
  default = "keshavlab1-asp"
  type        = string
}

variable "web_app_name" {
  default = "keshavlab1-web"
  type        = string
}
