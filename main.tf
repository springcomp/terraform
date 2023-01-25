terraform {
	backend "azurerm" {}
}

provider "azurerm" {
    features                                              {}
    alias                                                 = "az"
    subscription_id                                       = var.subscription_id
    tenant_id                                             = var.tenant_id
}

provider "azurerm" {
    features                                              {}
    alias                                                 = "log"
    subscription_id                                       = var.subscription_id
    tenant_id                                             = var.tenant_id
}

resource "azurerm_resource_group" "main" {
	name     = "rg-main"
	location = "West Europe"
	provider = azurerm.az
}

module "module" {
	source = "C:\\Projects\\tf\\modules\\module"
	providers = {
		azurerm.az = azurerm.az
		azurerm.log = azurerm.log
	}
}