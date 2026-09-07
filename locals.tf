locals {
  name_prefix = "${var.project_name}-${var.environment}"

  common_tags = merge(
    var.tags,
    {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  )

  private_dns_zones = {
    keyvault = "privatelink.vaultcore.azure.net"
    acr      = "privatelink.azurecr.io"
  }
}