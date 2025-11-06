variable "sql_database" {
  type = map(any)
}

resource "azurerm_mssql_database" "sql_db" {
  for_each       = var.sql_database
  name           = each.value.sql_name
  server_id      = each.value.server_id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 4
  sku_name       = "S0"
  enclave_type   = "VBS"

}
