terraform {
    required_version = "2.13.0"
    backend "azurerm"{
     resource_group_name  =  var.rg
     storage_account_name = "s1234567abcd"
     container_name       = "c1234567abcd"
     key                  = "terraform.tfstate"
     access_keys          ="wQeOkNzkMygUusQIdiRD1xNo1Vtl8GzZ2pc3VpFdZLNv+1CXSORrjMbIuEbVP/awZuo1+4W17sXEeMkDMyhQRQ=="
     connection_string    ="DefaultEndpointsProtocol=https;AccountName=s1234567abc;AccountKey=wQeOkNzkMygUusQIdiRD1xNo1Vtl8GzZ2pc3VpFdZLNv+1CXSORrjMbIuEbVP/awZuo1+4W17sXEeMkDMyhQRQ==;EndpointSuffix=core.windows.net"
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

