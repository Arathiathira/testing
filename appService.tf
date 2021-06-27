resource "azurerm_app_service_plan" "myasp"{
    name                ="Arathiasp"
    location            ="South India"
    resource_group_name ="arsrg"
    sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "myapps"{
    name                ="Arathiappservice"
    location            ="South India"
    resource_group_name ="arsrg"
    app_service_plan_id =app_service_plan.myasp.id
}
