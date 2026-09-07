output "resource_group_name" {
  description = "Resource Group name"
  value       = azurerm_resource_group.rg.name
}

output "aks_name" {
  description = "AKS cluster name"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "aks_private_fqdn" {
  description = "Private AKS API server FQDN"
  value       = azurerm_kubernetes_cluster.aks.private_fqdn
}

output "aks_oidc_issuer_url" {
  description = "AKS OIDC issuer URL"
  value       = azurerm_kubernetes_cluster.aks.oidc_issuer_url
}

output "acr_name" {
  description = "Azure Container Registry"
  value       = azurerm_container_registry.acr.name
}

output "acr_login_server" {
  description = "ACR login server"
  value       = azurerm_container_registry.acr.login_server
}

output "keyvault_name" {
  description = "Key Vault name"
  value       = azurerm_key_vault.kv.name
}

output "keyvault_uri" {
  description = "Key Vault URI"
  value       = azurerm_key_vault.kv.vault_uri
}

output "application_identity_client_id" {
  description = "Client ID of application workload identity"
  value       = azurerm_user_assigned_identity.application.client_id
}

output "application_identity_principal_id" {
  description = "Principal ID of application workload identity"
  value       = azurerm_user_assigned_identity.application.principal_id
}

output "workload_namespace" {
  description = "Application namespace"
  value       = var.workload_namespace
}

output "workload_service_account" {
  description = "Application service account"
  value       = var.workload_service_account
}