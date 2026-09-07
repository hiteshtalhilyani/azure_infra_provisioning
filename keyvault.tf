resource "azurerm_key_vault" "kv" {
  name                = var.keyvault_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tenant_id = var.tenant_id

  sku_name = "standard"

  rbac_authorization_enabled = true

  public_network_access_enabled = true

  soft_delete_retention_days = 90

  purge_protection_enabled = true

  tags = local.common_tags
}

resource "azurerm_private_endpoint" "keyvault" {
  name                = "${local.name_prefix}-kv-pe"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  subnet_id = azurerm_subnet.private_endpoints.id

  private_service_connection {
    name = "${local.name_prefix}-kv-private-connection"

    private_connection_resource_id = azurerm_key_vault.kv.id

    subresource_names = [
      "vault"
    ]

    is_manual_connection = false
  }

  private_dns_zone_group {
    name = "keyvault-dns-zone-group"

    private_dns_zone_ids = [
      azurerm_private_dns_zone.keyvault.id
    ]
  }

  tags = local.common_tags
}

