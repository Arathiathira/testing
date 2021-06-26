terraform {
    required_version = "2.13.0"
    backend "azurerm"{
     resource_group_name  =  var.rg
     storage_account_name = "s1234567abc"
     container_name       = "c1234567abc"
     key                  = "terraform.tfstate"
        features {}
    }
}

provider "azurerm"{
    version ="~>2.46.0"
    features {}
}

resource "azurerm_resource_group" "myrg"{
    name                =var.rg
    location            =var.loc
    tags                ={
        owner           = var.tag
    }
}

