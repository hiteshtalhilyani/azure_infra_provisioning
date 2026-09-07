# Private ACR 

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku = "Premium"

  admin_enabled = false

  public_network_access_enabled = false

  anonymous_pull_enabled = false

  retention_policy_in_days = 7

  tags = local.common_tags
}


resource "azurerm_private_endpoint" "acr" {
  name                = "${local.name_prefix}-acr-pe"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  subnet_id = azurerm_subnet.private_endpoints.id

  private_service_connection {
    name = "${local.name_prefix}-acr-private-connection"

    private_connection_resource_id = azurerm_container_registry.acr.id

    subresource_names = [
      "registry"
    ]

    is_manual_connection = false
  }

  private_dns_zone_group {
    name = "acr-dns-zone-group"

    private_dns_zone_ids = [
      azurerm_private_dns_zone.acr.id
    ]
  }

  tags = local.common_tags
}