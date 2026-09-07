resource "azurerm_role_assignment" "aks_acr_pull" {
  scope = azurerm_container_registry.acr.id

  role_definition_name = "AcrPull"

  principal_id = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id

  skip_service_principal_aad_check = true
}


resource "azurerm_role_assignment" "application_keyvault" {
  scope = azurerm_key_vault.kv.id

  role_definition_name = "Key Vault Secrets User"

  principal_id = azurerm_user_assigned_identity.application.principal_id
}

# Temporary Permission






