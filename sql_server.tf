# SQL Server instance
resource "azurerm_mssql_server" "example" {
  name                          = substr(replace("${var.resource_namer}-sql", "-", ""), 0, 63)
  resource_group_name           = var.resource_group_name
  location                      = var.resource_group_location
  version                       = var.sql_version
  administrator_login           = var.administrator_login
  administrator_login_password  = random_password.password.result
  public_network_access_enabled = var.public_network_access_enabled

  dynamic "azuread_administrator" {
    for_each = { for i in var.azuread_administrator : i.login_username => i }
    content {
      login_username = azuread_administrator.key
      object_id      = azuread_administrator.value.object_id
    }
  }


  tags = var.resource_tags
}
