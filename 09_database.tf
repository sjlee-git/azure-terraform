resource "azurerm_mysql_server" "sjlee_db" {
  name                = "sjlee-db"
  location            = "Japan East"
  resource_group_name = azurerm_resource_group.sjlee_rg.name

  administrator_login          = var.db_user # Database User ID
  administrator_login_password = var.db_passwd # Database Password

  sku_name   = "B_Gen5_1" # compute + storage
  /*
  B_Gen4_1 B_Gen4_2 B_Gen5_1 B_Gen5_2 
  GP_Gen4_2 GP_Gen4_4 GP_Gen4_8 GP_Gen4_16 GP_Gen4_32 GP_Gen5_2 GP_Gen5_4 GP_Gen5_8 GP_Gen5_16 GP_Gen5_32 GP_Gen5_64 
  MO_Gen5_2 MO_Gen5_4 MO_Gen5_8 MO_Gen5_16 MO_Gen5_32
  */
  storage_mb = 5120 # 1GB = 1024
  version    = "5.7" # engine major version

  backup_retention_days             = 7 # backup days / 7 ~ 35
  auto_grow_enabled                 = true # storage auto grow
  geo_redundant_backup_enabled      = false # geo backup / not supported for Basic
  infrastructure_encryption_enabled = false # data encryption
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = false # ssl
# ssl_minimal_tls_version_enforced  = "TLS1_2"
}

resource "azurerm_mysql_database" "wordpress_db" {
  name                = "wordpress"
  resource_group_name = azurerm_resource_group.sjlee_rg.name
  server_name         = azurerm_mysql_server.sjlee_db.name
  charset             = "utf8" # Inconfig
  collation           = "utf8_unicode_ci"
} # Create Database

resource "azurerm_mysql_firewall_rule" "db_firewall" {
  name                = "db-firewall"
  resource_group_name = azurerm_resource_group.sjlee_rg.name
  server_name         = azurerm_mysql_server.sjlee_db.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
} # Connent Security

/* 
allow ip
single IP --> start ip = end ip
IP range --> start ip ~ end ip
All allow --> 0.0.0.0 255.255.255.255
*/