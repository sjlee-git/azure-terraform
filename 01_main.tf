provider "azurerm" {
    features {
    }
}   
/*
    뒤에 붙은 수식어 따라 감
    resource_group_name = azurerm_resource_group.sjlee_rg.name --> name
    location            = azurerm_resource_group.sjlee_rg.location --> location
*/
resource "azurerm_resource_group" "sjlee_rg" {
  name     = "sjlee-rg"
  location = var.region
} # Create Resource Group