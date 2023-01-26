resource "azurerm_resource_group" "module" {
	name     = "rg-module"
	location = "West Europe"
}

module "submodule" {
  count  = local.log_enabled ? 1 : 0
	source = "C:\\Projects\\tf\\modules\\submodule"
  providers = {
    azurerm = azurerm.log
  }
}