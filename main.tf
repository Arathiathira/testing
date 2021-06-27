terraform {
    required_version = ">= 0.11"
    backend "azurerm"{
   //  resource_group_name  =  "r1234567abc"
     storage_account_name = "s1234567abc"
     container_name       = "c1234567abc"
     key                  = "terraform.tfstate"
     access_keys          ="wQeOkNzkMygUusQIdiRD1xNo1Vtl8GzZ2pc3VpFdZLNv+1CXSORrjMbIuEbVP/awZuo1+4W17sXEeMkDMyhQRQ=="
     connection_string    ="DefaultEndpointsProtocol=https;AccountName=s1234567abc;AccountKey=wQeOkNzkMygUusQIdiRD1xNo1Vtl8GzZ2pc3VpFdZLNv+1CXSORrjMbIuEbVP/awZuo1+4W17sXEeMkDMyhQRQ==;EndpointSuffix=core.windows.net"
        features {}
    }
}

provider "azurerm"{
    version ="=2.46.0"
    features {}
}

resource "azurerm_resource_group" "myrg"{
    name                ="arsrg"
    location            ="East US"
    tags                ={
        owner           = "Arathi"
    }
}
  
resource "azurerm_app_service_plan" "myasp"{
    name                ="Arathiasp"
    location            ="East US"
    resource_group_name =azurerm_resource_group.myrg.name
    sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "myapps"{
    name                ="Arathiappservice"
    location            ="East US"
    resource_group_name ="arsrg"
    app_service_plan_id =azurerm_app_service_plan.myasp.id
}

