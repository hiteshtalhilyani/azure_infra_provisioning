resource "azurerm_user_assigned_identity" "application" {
  name = "${local.name_prefix}-application-identity"

  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = local.common_tags
}


resource "azurerm_federated_identity_credential" "application" {
  name = "${local.name_prefix}-application-federated"

  resource_group_name = azurerm_resource_group.rg.name

  parent_id = azurerm_user_assigned_identity.application.id

  issuer = azurerm_kubernetes_cluster.aks.oidc_issuer_url

  subject = "system:serviceaccount:${var.workload_namespace}:${var.workload_service_account}"

  audience = [
    "api://AzureADTokenExchange"
  ]
}