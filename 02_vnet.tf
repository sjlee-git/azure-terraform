resource "azurerm_virtual_network" "sjlee_vnet" {
  name                = "sjlee-vnet"
  resource_group_name = azurerm_resource_group.sjlee_rg.name
  location            = azurerm_resource_group.sjlee_rg.location
  address_space       = ["10.0.0.0/8"]
} # setting vnet