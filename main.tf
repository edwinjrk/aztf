provider "azurerm" {
    version = "2.5.0"
    features {}
}

terraform {
    backend "azurerm" {
        resource_group_name = "tf_rg_blobstore"
        storage_account_name = "tfstorageaccountedwin"
        container_name = "tfstate"
        key = "terraform.tfstate"
    }
}

variable "imagebuild" {
    type = string
    description = "Latest image build"
}

resource "azurerm_resource_group" "tf_test" {
    name        = "tfmain"
    location    = "central us"
}

resource "azurerm_container_group" "tfcg_test" {
    name                = "weatherapi"
    location            = azurerm_resource_group.tf_test.location
    resource_group_name = azurerm_resource_group.tf_test.name

    ip_address_type     = "public"
    dns_name_label      = "aztftestdns"
    os_type             = "linux"

    container {
        name = "weatherapi"
        image = "rkedwinjose/aztf:${var.imagebuild}"
        cpu = "1"
        memory = "1"

        ports {
            port = 80
            protocol = "TCP"
        }
    }
}