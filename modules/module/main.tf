resource "azurerm_resource_group" "module" {
	name     = "rg-module"
	location = "West Europe"
  provider = azurerm.az
}

module "submodule" {
	source = "C:\\Projects\\tf\\modules\\submodule"
  providers = {
    azurerm = azurerm.log
  }
}