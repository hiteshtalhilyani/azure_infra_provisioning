subscription_id = "e131234d-93db-4399-a2c8-ce23c8a45a6e"

tenant_id = "92f4ff8b-902d-42ec-848f-7040a6a15a29"

location = "uaenorth"

environment = "dev"

project_name = "secureaks"

resource_group_name = "rg-secure-aks"

aks_name = "aks-secure-dev"

aks_dns_prefix = "aks-secure-dev"

acr_name = "acrsecureaksdev123"

keyvault_name = "kvsecureaksdev123"

node_vm_size = "Standard_D2als_v7"

system_node_count = 1

workload_namespace = "application-a"

workload_service_account = "app-sa"

keyvault_secret_name = "application-secret"

tags = {
  Environment = "dev"
  ManagedBy   = "Terraform"
  Project     = "SecureAKS"
  Owner       = "DevOps"
}