# Key Vault Private DNS

resource "azurerm_private_dns_zone" "keyvault" {
  name                = local.private_dns_zones.keyvault
  resource_group_name = azurerm_resource_group.rg.name

  tags = local.common_tags
}

# Link to VNet

resource "azurerm_private_dns_zone_virtual_network_link" "keyvault" {
  name                  = "${local.name_prefix}-kv-dns-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.keyvault.name
  virtual_network_id    = azurerm_virtual_network.vnet.id

  registration_enabled = false
}

# ACR Private DNS

resource "azurerm_private_dns_zone" "acr" {
  name                = local.private_dns_zones.acr
  resource_group_name = azurerm_resource_group.rg.name

  tags = local.common_tags
}


# Link to VNet

resource "azurerm_private_dns_zone_virtual_network_link" "acr" {
  name                  = "${local.name_prefix}-acr-dns-link"
  resource_group_name   = azurerm_resource_group.rg.name
  private_dns_zone_name = azurerm_private_dns_zone.acr.name
  virtual_network_id    = azurerm_virtual_network.vnet.id

  registration_enabled = false
}

