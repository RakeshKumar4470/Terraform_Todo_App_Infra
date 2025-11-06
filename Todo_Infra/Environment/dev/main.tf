variable "rg_inputs" {}
variable "vnetwork" {}
variable "storage_account" {}
variable "azurerm_key_vault" {}
variable "azurerm_sql_server" {}
variable "aks_cluster" {}
variable "sql_db" {
  type = map(any)
}
variable "acr_registory" {}

module "rgs" {
  source = "../../Modules/azurerm_rg"
  rgs    = var.rg_inputs
}

module "stg" {
  depends_on = [module.rgs]
  source     = "../../Modules/azurerm_storage_account"
  storage    = var.storage_account
}
module "vnet" {
  depends_on = [module.rgs]
  source     = "../../Modules/azurerm_vnet"
  vnet_name  = var.vnetwork
}

module "kvault" {
  depends_on = [module.rgs]
  source     = "../../Modules/azurerm_Key_vault"
  key_vault  = var.azurerm_key_vault
}

module "sql" {
  depends_on = [module.rgs]
  source     = "../../Modules/azurerm_sql_server"
  sql        = var.azurerm_sql_server
}

module "sql_database" {
  depends_on   = [module.sql]
  source       = "../../Modules/azurerm_sql_database"
  sql_database = var.sql_db
}

module "k8s" {
  depends_on = [module.rgs]
  source     = "../../Modules/azurerm_K8s_Cluster"
  kubernetes = var.aks_cluster
}


module "acr_registry" {
  depends_on    = [module.rgs]
  source        = "../../Modules/azurerm_container_registory"
  acr_registory = var.acr_registory

}
