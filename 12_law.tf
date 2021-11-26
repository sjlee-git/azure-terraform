resource "azurerm_log_analytics_workspace" "law" {
    name                = "sjlee-workspace"
    location            = azurerm_resource_group.sjlee_rg.location
    resource_group_name = azurerm_resource_group.sjlee_rg.name
    sku                 = "PerGB2018"
    retention_in_days   = 30
}