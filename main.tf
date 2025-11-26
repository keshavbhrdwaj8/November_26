
module "storage_account" {
  source                = "./modules/storage_account"
  storage_account_name  = var.storage_account_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}

module "key_vault" {
  source              = "./modules/key_vault"
  key_vault_name      = var.key_vault_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

module "app_service_plan" {
  source                = "./modules/app_service_plan"
  app_service_plan_name = var.app_service_plan_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}

module "web_app" {
  source              = "./modules/web_app"
  web_app_name        = var.web_app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = module.app_service_plan.id
  tags                = var.tags
}
