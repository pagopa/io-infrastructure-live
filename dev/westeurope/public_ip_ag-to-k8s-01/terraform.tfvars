# Creates a Kubernetes Cluster through AKS using the Kubenet CNI.
# For more info look at the README.md file of the module.

terragrunt = {
  dependencies {
    paths = [
      "../resource_group"
    ]
  }

  terraform {
    source = "git::git@github.com:teamdigitale/io-infrastructure-modules.git//azurerm_public_ip"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

# Public IP module variables
azurerm_public_ip_name      = "ag-to-k8s-01"
azurerm_resource_group_name = "io-dev-rg"
azurerm_public_ip_sku       = "Standard"
