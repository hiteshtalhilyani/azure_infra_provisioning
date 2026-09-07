
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_container_registry.acr will be created
  + resource "azurerm_container_registry" "acr" {
      + admin_enabled                                = false
      + admin_password                               = (sensitive value)
      + admin_username                               = (known after apply)
      + anonymous_pull_enabled                       = false
      + azuread_authentication_as_arm_policy_enabled = true
      + data_endpoint_host_names                     = (known after apply)
      + encryption                                   = (known after apply)
      + export_policy_enabled                        = true
      + id                                           = (known after apply)
      + location                                     = "uaenorth"
      + login_server                                 = (known after apply)
      + name                                         = "acrsecureaksdev123"
      + network_rule_bypass_for_tasks_enabled        = false
      + network_rule_bypass_option                   = "AzureServices"
      + network_rule_set                             = (known after apply)
      + public_network_access_enabled                = false
      + resource_group_name                          = "rg-secure-aks"
      + retention_policy_in_days                     = 7
      + role_assignment_mode                         = "LegacyRegistryPermissions"
      + sku                                          = "Premium"
      + tags                                         = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Owner"       = "DevOps"
          + "Project"     = "secureaks"
        }
      + trust_policy_enabled                         = false
      + zone_redundancy_enabled                      = false
    }

  # azurerm_federated_identity_credential.application will be created
  + resource "azurerm_federated_identity_credential" "application" {
      + audience                  = [
          + "api://AzureADTokenExchange",
        ]
      + id                        = (known after apply)
      + issuer                    = (known after apply)
      + name                      = "secureaks-dev-application-federated"
      + parent_id                 = (known after apply)
      + resource_group_name       = "rg-secure-aks"
      + subject                   = "system:serviceaccount:application-a:app-sa"
      + user_assigned_identity_id = (known after apply)
    }

  # azurerm_key_vault.kv will be created
  + resource "azurerm_key_vault" "kv" {
      + access_policy                 = (known after apply)
      + enable_rbac_authorization     = (known after apply)
      + id                            = (known after apply)
      + location                      = "uaenorth"
      + name                          = "kvsecureaksdev123"
      + public_network_access_enabled = false
      + purge_protection_enabled      = true
      + rbac_authorization_enabled    = true
      + resource_group_name           = "rg-secure-aks"
      + sku_name                      = "standard"
      + soft_delete_retention_days    = 90
      + tags                          = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Owner"       = "DevOps"
          + "Project"     = "secureaks"
        }
      + tenant_id                     = "92f4ff8b-902d-42ec-848f-7040a6a15a29"
      + vault_uri                     = (known after apply)

      + contact (known after apply)

      + network_acls (known after apply)
    }

  # azurerm_key_vault_secret.application_secret will be created
  + resource "azurerm_key_vault_secret" "application_secret" {
      + id                      = (known after apply)
      + key_vault_id            = (known after apply)
      + name                    = "application-secret"
      + resource_id             = (known after apply)
      + resource_versionless_id = (known after apply)
      + tags                    = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Owner"       = "DevOps"
          + "Project"     = "secureaks"
        }
      + value                   = (sensitive value)
      + value_wo                = (write-only attribute)
      + version                 = (known after apply)
      + versionless_id          = (known after apply)
    }

  # azurerm_kubernetes_cluster.aks will be created
  + resource "azurerm_kubernetes_cluster" "aks" {
      + ai_toolchain_operator_enabled       = false
      + azure_policy_enabled                = true
      + current_kubernetes_version          = (known after apply)
      + dns_prefix                          = "aks-secure-dev"
      + fqdn                                = (known after apply)
      + http_application_routing_zone_name  = (known after apply)
      + id                                  = (known after apply)
      + kube_admin_config                   = (sensitive value)
      + kube_admin_config_raw               = (sensitive value)
      + kube_config                         = (sensitive value)
      + kube_config_raw                     = (sensitive value)
      + kubernetes_version                  = (known after apply)
      + local_account_disabled              = true
      + location                            = "uaenorth"
      + name                                = "aks-secure-dev"
      + node_os_upgrade_channel             = "NodeImage"
      + node_resource_group                 = (known after apply)
      + node_resource_group_id              = (known after apply)
      + oidc_issuer_enabled                 = true
      + oidc_issuer_url                     = (known after apply)
      + portal_fqdn                         = (known after apply)
      + private_cluster_enabled             = true
      + private_cluster_public_fqdn_enabled = false
      + private_dns_zone_id                 = "System"
      + private_fqdn                        = (known after apply)
      + resource_group_name                 = "rg-secure-aks"
      + role_based_access_control_enabled   = true
      + run_command_enabled                 = true
      + sku_tier                            = "Free"
      + support_plan                        = "KubernetesOfficial"
      + tags                                = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Owner"       = "DevOps"
          + "Project"     = "secureaks"
        }
      + workload_identity_enabled           = true

      + auto_scaler_profile (known after apply)

      + azure_active_directory_role_based_access_control {
          + admin_group_object_ids = []
          + azure_rbac_enabled     = true
          + tenant_id              = "92f4ff8b-902d-42ec-848f-7040a6a15a29"
        }

      + bootstrap_profile (known after apply)

      + default_node_pool {
          + kubelet_disk_type            = (known after apply)
          + max_pods                     = (known after apply)
          + name                         = "system"
          + node_count                   = 2
          + node_labels                  = (known after apply)
          + only_critical_addons_enabled = true
          + orchestrator_version         = (known after apply)
          + os_disk_size_gb              = (known after apply)
          + os_disk_type                 = "Managed"
          + os_sku                       = (known after apply)
          + scale_down_mode              = "Delete"
          + type                         = "VirtualMachineScaleSets"
          + ultra_ssd_enabled            = false
          + vm_size                      = "Standard_D4s_v5"
          + vnet_subnet_id               = (known after apply)
          + workload_runtime             = (known after apply)

          + upgrade_settings {
              + max_surge = "33%"
            }
        }

      + identity {
          + principal_id = (known after apply)
          + tenant_id    = (known after apply)
          + type         = "SystemAssigned"
        }

      + key_vault_secrets_provider {
          + secret_identity          = (known after apply)
          + secret_rotation_enabled  = true
          + secret_rotation_interval = "2m"
        }

      + kubelet_identity (known after apply)

      + network_profile {
          + dns_service_ip      = "10.20.0.10"
          + ip_versions         = (known after apply)
          + load_balancer_sku   = "standard"
          + network_data_plane  = "azure"
          + network_mode        = (known after apply)
          + network_plugin      = "azure"
          + network_plugin_mode = "overlay"
          + network_policy      = "azure"
          + outbound_type       = "loadBalancer"
          + pod_cidr            = (known after apply)
          + pod_cidrs           = (known after apply)
          + service_cidr        = "10.20.0.0/16"
          + service_cidrs       = (known after apply)

          + load_balancer_profile (known after apply)

          + nat_gateway_profile (known after apply)
        }

      + node_provisioning_profile (known after apply)

      + oms_agent {
          + log_analytics_workspace_id = (known after apply)
          + oms_agent_identity         = (known after apply)
        }

      + windows_profile (known after apply)
    }

  # azurerm_log_analytics_workspace.aks will be created
  + resource "azurerm_log_analytics_workspace" "aks" {
      + allow_resource_only_permissions = true
      + daily_quota_gb                  = -1
      + id                              = (known after apply)
      + internet_ingestion_enabled      = true
      + internet_query_enabled          = true
      + local_authentication_disabled   = (known after apply)
      + local_authentication_enabled    = true
      + location                        = "uaenorth"
      + name                            = "secureaks-dev-law"
      + primary_shared_key              = (sensitive value)
      + resource_group_name             = "rg-secure-aks"
      + retention_in_days               = 30
      + secondary_shared_key            = (sensitive value)
      + sku                             = "PerGB2018"
      + tags                            = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Owner"       = "DevOps"
          + "Project"     = "secureaks"
        }
      + workspace_id                    = (known after apply)
    }

  # azurerm_network_security_group.aks will be created
  + resource "azurerm_network_security_group" "aks" {
      + id                  = (known after apply)
      + location            = "uaenorth"
      + name                = "secureaks-dev-aks-nsg"
      + resource_group_name = "rg-secure-aks"
      + security_rule       = (known after apply)
      + tags                = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Owner"       = "DevOps"
          + "Project"     = "secureaks"
        }
    }

  # azurerm_private_dns_zone.acr will be created
  + resource "azurerm_private_dns_zone" "acr" {
      + id                                                    = (known after apply)
      + max_number_of_record_sets                             = (known after apply)
      + max_number_of_virtual_network_links                   = (known after apply)
      + max_number_of_virtual_network_links_with_registration = (known after apply)
      + name                                                  = "privatelink.azurecr.io"
      + number_of_record_sets                                 = (known after apply)
      + resource_group_name                                   = "rg-secure-aks"
      + tags                                                  = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Owner"       = "DevOps"
          + "Project"     = "secureaks"
        }

      + soa_record (known after apply)
    }

  # azurerm_private_dns_zone.keyvault will be created
  + resource "azurerm_private_dns_zone" "keyvault" {
      + id                                                    = (known after apply)
      + max_number_of_record_sets                             = (known after apply)
      + max_number_of_virtual_network_links                   = (known after apply)
      + max_number_of_virtual_network_links_with_registration = (known after apply)
      + name                                                  = "privatelink.vaultcore.azure.net"
      + number_of_record_sets                                 = (known after apply)
      + resource_group_name                                   = "rg-secure-aks"
      + tags                                                  = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Owner"       = "DevOps"
          + "Project"     = "secureaks"
        }

      + soa_record (known after apply)
    }

  # azurerm_private_dns_zone_virtual_network_link.acr will be created
  + resource "azurerm_private_dns_zone_virtual_network_link" "acr" {
      + id                    = (known after apply)
      + name                  = "secureaks-dev-acr-dns-link"
      + private_dns_zone_name = "privatelink.azurecr.io"
      + registration_enabled  = false
      + resolution_policy     = (known after apply)
      + resource_group_name   = "rg-secure-aks"
      + virtual_network_id    = (known after apply)
    }

  # azurerm_private_dns_zone_virtual_network_link.keyvault will be created
  + resource "azurerm_private_dns_zone_virtual_network_link" "keyvault" {
      + id                    = (known after apply)
      + name                  = "secureaks-dev-kv-dns-link"
      + private_dns_zone_name = "privatelink.vaultcore.azure.net"
      + registration_enabled  = false
      + resolution_policy     = (known after apply)
      + resource_group_name   = "rg-secure-aks"
      + virtual_network_id    = (known after apply)
    }

  # azurerm_private_endpoint.acr will be created
  + resource "azurerm_private_endpoint" "acr" {
      + custom_dns_configs       = (known after apply)
      + id                       = (known after apply)
      + location                 = "uaenorth"
      + name                     = "secureaks-dev-acr-pe"
      + network_interface        = (known after apply)
      + private_dns_zone_configs = (known after apply)
      + resource_group_name      = "rg-secure-aks"
      + subnet_id                = (known after apply)
      + tags                     = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Owner"       = "DevOps"
          + "Project"     = "secureaks"
        }

      + private_dns_zone_group {
          + id                   = (known after apply)
          + name                 = "acr-dns-zone-group"
          + private_dns_zone_ids = (known after apply)
        }

      + private_service_connection {
          + is_manual_connection           = false
          + name                           = "secureaks-dev-acr-private-connection"
          + private_connection_resource_id = (known after apply)
          + private_ip_address             = (known after apply)
          + subresource_names              = [
              + "registry",
            ]
        }
    }

  # azurerm_private_endpoint.keyvault will be created
  + resource "azurerm_private_endpoint" "keyvault" {
      + custom_dns_configs       = (known after apply)
      + id                       = (known after apply)
      + location                 = "uaenorth"
      + name                     = "secureaks-dev-kv-pe"
      + network_interface        = (known after apply)
      + private_dns_zone_configs = (known after apply)
      + resource_group_name      = "rg-secure-aks"
      + subnet_id                = (known after apply)
      + tags                     = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Owner"       = "DevOps"
          + "Project"     = "secureaks"
        }

      + private_dns_zone_group {
          + id                   = (known after apply)
          + name                 = "keyvault-dns-zone-group"
          + private_dns_zone_ids = (known after apply)
        }

      + private_service_connection {
          + is_manual_connection           = false
          + name                           = "secureaks-dev-kv-private-connection"
          + private_connection_resource_id = (known after apply)
          + private_ip_address             = (known after apply)
          + subresource_names              = [
              + "vault",
            ]
        }
    }

  # azurerm_resource_group.rg will be created
  + resource "azurerm_resource_group" "rg" {
      + id       = (known after apply)
      + location = "uaenorth"
      + name     = "rg-secure-aks"
      + tags     = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Owner"       = "DevOps"
          + "Project"     = "secureaks"
        }
    }

  # azurerm_role_assignment.aks_acr_pull will be created
  + resource "azurerm_role_assignment" "aks_acr_pull" {
      + condition_version                = (known after apply)
      + id                               = (known after apply)
      + name                             = (known after apply)
      + principal_id                     = (known after apply)
      + principal_type                   = (known after apply)
      + role_definition_id               = (known after apply)
      + role_definition_name             = "AcrPull"
      + scope                            = (known after apply)
      + skip_service_principal_aad_check = true
    }

  # azurerm_role_assignment.application_keyvault will be created
  + resource "azurerm_role_assignment" "application_keyvault" {
      + condition_version                = (known after apply)
      + id                               = (known after apply)
      + name                             = (known after apply)
      + principal_id                     = (known after apply)
      + principal_type                   = (known after apply)
      + role_definition_id               = (known after apply)
      + role_definition_name             = "Key Vault Secrets User"
      + scope                            = (known after apply)
      + skip_service_principal_aad_check = (known after apply)
    }

  # azurerm_role_assignment.terraform_keyvault_secrets_officer will be created
  + resource "azurerm_role_assignment" "terraform_keyvault_secrets_officer" {
      + condition_version                = (known after apply)
      + id                               = (known after apply)
      + name                             = (known after apply)
      + principal_id                     = "fe212fad-7129-4d5d-81a2-19f65c31529f"
      + principal_type                   = (known after apply)
      + role_definition_id               = (known after apply)
      + role_definition_name             = "Key Vault Secrets Officer"
      + scope                            = (known after apply)
      + skip_service_principal_aad_check = (known after apply)
    }

  # azurerm_subnet.aks will be created
  + resource "azurerm_subnet" "aks" {
      + address_prefixes                              = [
          + "10.10.1.0/24",
        ]
      + default_outbound_access_enabled               = true
      + id                                            = (known after apply)
      + name                                          = "secureaks-dev-aks-subnet"
      + private_endpoint_network_policies             = "Disabled"
      + private_link_service_network_policies_enabled = true
      + resource_group_name                           = "rg-secure-aks"
      + virtual_network_name                          = "secureaks-dev-vnet"
    }

  # azurerm_subnet.private_endpoints will be created
  + resource "azurerm_subnet" "private_endpoints" {
      + address_prefixes                              = [
          + "10.10.2.0/24",
        ]
      + default_outbound_access_enabled               = true
      + id                                            = (known after apply)
      + name                                          = "secureaks-dev-private-endpoint-subnet"
      + private_endpoint_network_policies             = "Disabled"
      + private_link_service_network_policies_enabled = true
      + resource_group_name                           = "rg-secure-aks"
      + virtual_network_name                          = "secureaks-dev-vnet"
    }

  # azurerm_subnet_network_security_group_association.aks will be created
  + resource "azurerm_subnet_network_security_group_association" "aks" {
      + id                        = (known after apply)
      + network_security_group_id = (known after apply)
      + subnet_id                 = (known after apply)
    }

  # azurerm_user_assigned_identity.application will be created
  + resource "azurerm_user_assigned_identity" "application" {
      + client_id           = (known after apply)
      + id                  = (known after apply)
      + location            = "uaenorth"
      + name                = "secureaks-dev-application-identity"
      + principal_id        = (known after apply)
      + resource_group_name = "rg-secure-aks"
      + tags                = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Owner"       = "DevOps"
          + "Project"     = "secureaks"
        }
      + tenant_id           = (known after apply)
    }

  # azurerm_virtual_network.vnet will be created
  + resource "azurerm_virtual_network" "vnet" {
      + address_space                  = [
          + "10.10.0.0/16",
        ]
      + dns_servers                    = (known after apply)
      + guid                           = (known after apply)
      + id                             = (known after apply)
      + location                       = "uaenorth"
      + name                           = "secureaks-dev-vnet"
      + private_endpoint_vnet_policies = "Disabled"
      + resource_group_name            = "rg-secure-aks"
      + subnet                         = (known after apply)
      + tags                           = {
          + "Environment" = "dev"
          + "ManagedBy"   = "Terraform"
          + "Owner"       = "DevOps"
          + "Project"     = "secureaks"
        }
    }

  # kubernetes_namespace.application will be created
  + resource "kubernetes_namespace" "application" {
      + id                               = (known after apply)
      + wait_for_default_service_account = false

      + metadata {
          + generation       = (known after apply)
          + name             = "application-a"
          + resource_version = (known after apply)
          + uid              = (known after apply)
        }
    }

  # kubernetes_service_account.application will be created
  + resource "kubernetes_service_account" "application" {
      + automount_service_account_token = true
      + default_secret_name             = (known after apply)
      + id                              = (known after apply)

      + metadata {
          + annotations      = (known after apply)
          + generation       = (known after apply)
          + name             = "app-sa"
          + namespace        = "application-a"
          + resource_version = (known after apply)
          + uid              = (known after apply)
        }
    }

Plan: 24 to add, 0 to change, 0 to destroy.
╷
│ Warning: Argument is deprecated
│
│   with azurerm_federated_identity_credential.application,
│   on identities.tf line 14, in resource "azurerm_federated_identity_credential" "application":
│   14:   resource_group_name = azurerm_resource_group.rg.name
│
│ This field is no longer used and will be removed in the next major version of the Azure Provider
╵

────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Saved the plan to: tfplan.md