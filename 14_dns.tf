resource "azurerm_dns_zone" "dns-zone" {
  name                = "sjlee.pw"
  resource_group_name = azurerm_resource_group.sjlee_rg.name
}
resource "azurerm_dns_a_record" "dns_a" {
  name                = "@"
  zone_name           = azurerm_dns_zone.dns-zone.name
  resource_group_name = azurerm_resource_group.sjlee_rg.name
  ttl                 = 300
  records             = ["20.196.242.64"] # Appgateway IP
}
resource "azurerm_dns_txt_record" "txt" {
  name                = "_acme-challenge"
  zone_name           = azurerm_dns_zone.dns-zone.name
  resource_group_name = azurerm_resource_group.sjlee_rg.name
  ttl                 = 300

  record {
    value = "UObrf8lwFTpgVsrAzznz7vHXCNfPR8WVSt20lM5pacs" # SSL
  }
}