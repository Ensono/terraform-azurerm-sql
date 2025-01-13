resource "azurerm_mssql_database" "example-db" {
  for_each                    = toset(var.sql_db_names)
  name                        = each.key
  server_id                   = azurerm_mssql_server.example.id
  create_mode                 = var.create_mode
  sample_name                 = var.sample_name
  collation                   = var.collation
  license_type                = var.license_type
  sku_name                    = var.sku_name
  zone_redundant              = var.zone_redundant
  auto_pause_delay_in_minutes = var.auto_pause_delay_in_minutes
  tags                        = var.resource_tags

}
