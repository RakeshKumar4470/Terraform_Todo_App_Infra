variable "rg_inputs" {}

module "rgs" {
  source = "../../Modules/azurerm_rg"
  rgs    = var.rg_inputs
}
