terraform {
    required_version = "2.13.0"
    backend "azurerm"{
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

