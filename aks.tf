resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  dns_prefix = var.aks_dns_prefix

  kubernetes_version = null

  private_cluster_enabled = true

  private_dns_zone_id = "System"

  local_account_disabled = true

  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  role_based_access_control_enabled = true

  azure_policy_enabled = true

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name = "system"

    vm_size    = var.node_vm_size
    node_count = var.system_node_count

    vnet_subnet_id = azurerm_subnet.aks.id

    type = "VirtualMachineScaleSets"

    only_critical_addons_enabled = true

    upgrade_settings {
      max_surge = "33%"
    }
  }

  network_profile {
    network_plugin = "azure"

    network_plugin_mode = "overlay"

    network_policy = "azure"

    load_balancer_sku = "standard"

    service_cidr = var.service_cidr

    dns_service_ip = var.dns_service_ip

    outbound_type = "loadBalancer"
  }

  azure_active_directory_role_based_access_control {
    tenant_id              = var.tenant_id
    azure_rbac_enabled     = true
    admin_group_object_ids = []
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }

  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.aks.id
  }

  tags = local.common_tags

  depends_on = [
    azurerm_subnet_network_security_group_association.aks
  ]
}


# Log Analytics 

resource "azurerm_log_analytics_workspace" "aks" {
  name                = "${local.name_prefix}-law"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku               = "PerGB2018"
  retention_in_days = 30

  tags = local.common_tags
}