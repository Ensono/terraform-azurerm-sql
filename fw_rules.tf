# Adding Sql Network Rules 
resource "azurerm_mssql_firewall_rule" "example_fw_rule" {
  for_each         = { for i in var.sql_fw_rules : i.name => i if var.public_network_access_enabled == true }
  name             = each.key
  server_id        = azurerm_mssql_server.example.id
  start_ip_address = each.value.start_ip_address
  end_ip_address   = each.value.end_ip_address
}
