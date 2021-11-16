terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id            = var.subscription_id
  client_id                  = var.client_id
  client_secret              = var.client_secret
  tenant_id                  = var.tenant_id
 skip_provider_registration = "true"
}

resource "azurerm_container_group" "fastapi_container" {
  name                = "fastapi_app"
  location            = "westeurope"
  resource_group_name = "natixis_devops"
  ip_address_type     = "public"
  os_type             = "linux"

  container {
    name   = "fastapi-app"
    image  = var.image_name
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 5000
      protocol = "TCP"
    }
  }

  image_registry_credential {
    server   = var.docker_server_url
    username = var.docker_username
    password = var.docker_password
  }
}

output "ip_address" {
  value = "${azurerm_container_group.fastapi_container.ip_address}"
}