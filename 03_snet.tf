resource "azurerm_subnet" "cluster_snet" {
  name                 = "cluster-snet"
  resource_group_name  = azurerm_resource_group.sjlee_rg.name
  virtual_network_name = azurerm_virtual_network.sjlee_vnet.name
  address_prefixes     = ["10.240.0.0/16"]
} # Cluster Subnet

resource "azurerm_subnet" "appgw_snet" {
  name                 = "appgw-snet"
  resource_group_name  = azurerm_resource_group.sjlee_rg.name
  virtual_network_name = azurerm_virtual_network.sjlee_vnet.name
  address_prefixes     = ["10.1.0.0/16"]
} # AppGateway Subnet

resource "azurerm_subnet" "db_snet" {
  name                 = "db-snet"
  resource_group_name  = azurerm_resource_group.sjlee_rg.name
  virtual_network_name = azurerm_virtual_network.sjlee_vnet.name
  address_prefixes     = ["10.255.255.248/29"]
} # Database Subnet

resource "azurerm_subnet" "vm_snet" {
  name                 = "vm-snet"
  resource_group_name  = azurerm_resource_group.sjlee_rg.name
  virtual_network_name = azurerm_virtual_network.sjlee_vnet.name
  address_prefixes     = ["10.100.0.0/16"]
} # Virtual Machine Subnet