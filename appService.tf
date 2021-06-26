resource "azurerm_app_service_plan" "myasp"{
    name                =var.nameasp
    location            =var.loc
    resource_group_name =var.rg
    sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "myapps"{
    name                =var.nameasp
    location            =var.loc
    resource_group_name =var.rg
    app_service_plan_id =app_service_plan.myasp.id
}