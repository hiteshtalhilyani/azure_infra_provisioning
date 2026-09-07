# Key Components
    Private AKS – Kubernetes cluster with private API access
    Workload Identity – Secure Azure authentication
    Azure Key Vault – Private secret management
    ACR – Private container image registry
    Private Endpoints – Secure private connectivity
    Security
    No public access to AKS, ACR, or Key Vault
    Workloads authenticate using Workload Identity
    Azure resources communicate through the private network

# Infra Provisioning - Terraform Structure files to create

        terraform/
        ├── providers.tf
        ├── variables.tf
        ├── locals.tf
        ├── resource-group.tf
        ├── network.tf
        ├── private-dns.tf
        ├── aks.tf
        ├── acr.tf
        ├── keyvault.tf
        ├── identities.tf
        ├── role-assignments.tf
        ├── outputs.tf
        └── terraform.tfvars

# Steps to perform to provision the env.
    cd /User/terraform  - Go to the terraform directory
        1. terraform init
        2. terraform fmt -recursive
        3. terraform validate 

# Output 
PS C:\Users\LENOVO\AZURE\Assignment\Final> terraform validate
Success! The configuration is valid.

    4. terraform plan -out tfplan
    5. terraform apply tfplan

# Terraform Output

    acr_login_server = "acrsecureaksdev123.azurecr.io"
    acr_name = "acrsecureaksdev123"
    aks_name = "aks-secure-dev"
    aks_oidc_issuer_url = "https://uaenorth.oic.prod-aks.azure.com/92f4ff8b-902d-42ec-848f-7040a6a15a29/e357f456-b863-4af8-850c-4615569d16d4/"
    aks_private_fqdn = "aks-secure-dev-nkgs3bj2.e3e306a7-4067-48cb-89c7-69fb4f5f25cf.privatelink.uaenorth.azmk8s.io"
    application_identity_client_id = "dbd33501-0c71-4b8a-b421-71204d2dc36e"
    application_identity_principal_id = "0e90081f-44b1-42ca-8d97-751c86c2092d"
    keyvault_name = "************123"
    keyvault_uri = "https://kvsecureaksdev123.vault.azure.net/"
    resource_group_name = "rg-secure-aks"
    workload_namespace = "application-a"
    workload_service_account = "app-sa"
