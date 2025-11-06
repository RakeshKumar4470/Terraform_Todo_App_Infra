variable "acr_registory" {}

resource "azurerm_container_registry" "acr" {
    for_each = var.acr_registory
  name                = each.value.acr_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  sku                 = "Premium"
  admin_enabled       = false
  georeplications {
    location                = "East US"
    zone_redundancy_enabled = true
    tags                    = {}
  }
  georeplications {
    location                = "North Europe"
    zone_redundancy_enabled = true
    tags                    = {}
  }
}