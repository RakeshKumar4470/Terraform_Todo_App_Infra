variable "sql" {}

resource "azurerm_mssql_server" "sql_server" {
  for_each                     = var.sql
  name                         = each.value.sql_name
  resource_group_name          = each.value.rg_name
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = each.value.admin_name
  administrator_login_password = each.value.password
  minimum_tls_version          = "1.2"
}
