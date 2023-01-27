locals {
	azurerm_logmanagement_subscription_id = "c83e4303-5840-4128-bc4f-0a274002fcf9"
	azurerm_logmanagement_tenant_id = "e6cbec2f-2f23-43ca-82c4-51a7c9b71e7a"
}

provider "azurerm" {
    features            {}
	alias               = "log"
    subscription_id     = local.azurerm_logmanagement_subscription_id
    tenant_id           = local.azurerm_logmanagement_tenant_id
}