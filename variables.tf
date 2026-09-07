variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "uaenorth"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "secureaks"
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
  default     = "rg-secure-aks"
}

variable "vnet_address_space" {
  description = "VNet CIDR"
  type        = list(string)

  default = [
    "10.10.0.0/16"
  ]
}

variable "aks_subnet_cidr" {
  description = "AKS subnet CIDR"
  type        = list(string)

  default = [
    "10.10.1.0/24"
  ]
}

variable "private_endpoint_subnet_cidr" {
  description = "Private Endpoint subnet CIDR"
  type        = list(string)

  default = [
    "10.10.2.0/24"
  ]
}

variable "aks_name" {
  description = "AKS cluster name"
  type        = string
  default     = "aks-secure-dev"
}

variable "acr_name" {
  description = "Globally unique ACR name. Only lowercase letters and numbers."
  type        = string
  default     = "acrsecureaksdev"
}

variable "keyvault_name" {
  description = "Globally unique Key Vault name"
  type        = string
  default     = "kv-secure-aks-dev"
}

variable "aks_dns_prefix" {
  description = "AKS DNS prefix"
  type        = string
  default     = "aks-secure-dev"
}

variable "node_vm_size" {
  description = "AKS node VM size"
  type        = string
  default     = "Standard_D4s_v5"
}

variable "system_node_count" {
  description = "Number of AKS system nodes"
  type        = number
  default     = 2
}

variable "service_cidr" {
  description = "AKS Kubernetes service CIDR"
  type        = string
  default     = "10.20.0.0/16"
}

variable "dns_service_ip" {
  description = "AKS DNS service IP"
  type        = string
  default     = "10.20.0.10"
}

variable "docker_bridge_cidr" {
  description = "Docker bridge CIDR"
  type        = string
  default     = "172.17.0.1/16"
}

variable "workload_namespace" {
  description = "Namespace for workload accessing Key Vault"
  type        = string
  default     = "application-a"
}

variable "workload_service_account" {
  description = "Kubernetes ServiceAccount allowed to access Key Vault"
  type        = string
  default     = "app-sa"
}

variable "keyvault_secret_name" {
  description = "Example secret stored in Key Vault"
  type        = string
  default     = "application-secret"
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)

  default = {
    Environment = "dev"
    ManagedBy   = "Terraform"
    Project     = "SecureAKS"
  }
}