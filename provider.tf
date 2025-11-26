
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.113"
    }
  }

  # Uncomment to use Azure Storage as remote backend for Terraform state
  # backend "azurerm" {
  #   resource_group_name  = "<existing-rg>"
  #   storage_account_name = "<existing-sa>"
  #   container_name       = "tfstate"
  #   key                  = "lab1/terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
  subscription_id = "679f3d56-bed2-429f-9e31-4d7bf67e14c7"
}
