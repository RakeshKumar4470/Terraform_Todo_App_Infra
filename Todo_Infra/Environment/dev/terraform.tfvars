rg_inputs = {
  name     = "rg_dev_group"
  location = "westus"
}

vnetwork = {
  vnet_name           = "vnet1"
  resource_group_name = "rg_dev_group"
  location            = "westus"
}

storage_account = {
  name                     = "secret_storage"
  location                 = "westus"
  resource_group_name      = "rg_dev_group"
  account_replication_type = "GRS"
  account_tier             = "Standard"
}

azurerm_key_vault = {
  name                = "todo_key_vault"
  location            = "westus"
  resource_group_name = "rg_dev_group"
}

azurerm_sql_server = {
     sql_name   = "sql-server-todo"
    rg_name    = "rg_dev_group"
    location   = "westus"
    admin_name = "admin"
    password   = "P@ssw01rd@123"
}

aks_cluster = {
  cluster_name = "k8s_dev_todoApp"
  location     = "westus"
  rg_name      = "rg_dev_group"
  dns_prefix   = "k8s_dev_todoApp"
}

sql_db = {
  sql_name = "sql_db_todo"
  server_id = module.sql.server_id
}

acr_registory = {
  acr_name = "acr_dev_todo"
  rg_name  = "rg_dev_group"
  location = "westus"
}
