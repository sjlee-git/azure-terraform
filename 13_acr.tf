resource "azurerm_container_registry" "acr" {
  name                = "sjleeacr"
  resource_group_name = azurerm_resource_group.sjlee_rg.name
  location            = azurerm_resource_group.sjlee_rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

# az aks update -n sjlee-aks -g sjlee-rg --attach-acr sjleeacr
resource "azurerm_role_assignment" "ra5" {
    scope                = azurerm_container_registry.acr.id
    role_definition_name = "AcrPull"
    principal_id         = var.aks_service_principal_object_id
}