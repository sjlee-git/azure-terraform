  resource "azurerm_public_ip" "vm_public_ip" {
    name                = "sjlee-vm-ip"
    resource_group_name = azurerm_resource_group.sjlee_rg.name
    location            = azurerm_resource_group.sjlee_rg.location
    allocation_method   = "Static"
  } # public ip create

resource "azurerm_network_interface" "vm_nic" {
  name                = "sjlee-vm-nic"
  location            = azurerm_resource_group.sjlee_rg.location
  resource_group_name = azurerm_resource_group.sjlee_rg.name

  ip_configuration {
    name                          = "sjlee-vm-ip"
    subnet_id                     = azurerm_subnet.vm_snet.id # subnet select
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.vm_public_ip.id
    # public ip insert
  }
} # network interface
