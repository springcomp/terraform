terraform {
  backend "azurerm" {}
}

provider "azurerm" {
    features                                              {}
    subscription_id                                       = var.subscription_id
    tenant_id                                             = var.tenant_id
}

resource "azurerm_resource_group" "main" {
  name     = "rg-main"
  location = "West Europe"
}

module "module" {
  source = "C:\\Projects\\tf\\modules\\module"

  environment = var.environment
  log_enabled = !var.local_debugging 

  providers = {
    azurerm = azurerm
    azurerm.log = azurerm
  }
}
