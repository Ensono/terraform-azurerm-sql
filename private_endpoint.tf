
resource "azurerm_private_endpoint" "pe" {
  count               = var.enable_private_network ? 1 : 0
  name                = "${azurerm_mssql_server.example.name}-sql-pe"
  resource_group_name = var.pe_resource_group_name
  location            = var.pe_resource_group_location
  subnet_id           = var.pe_subnet_id

  private_service_connection {
    name                           = "${azurerm_mssql_server.example.name}-sql-pe"
    is_manual_connection           = var.is_manual_connection
    private_connection_resource_id = azurerm_mssql_server.example.id
    subresource_names              = ["sqlServer"]
  }

  private_dns_zone_group {
    name                 = azurerm_mssql_server.example.name
    private_dns_zone_ids = [data.azurerm_private_dns_zone.sql_pvt_dns[0].id]
  }
}
