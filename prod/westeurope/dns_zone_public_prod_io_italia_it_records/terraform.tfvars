terragrunt = {
  dependencies {
    paths = [
      "../dns_zone_public_prod_io_italia_it",
      "../public_ip_ag-to-k8s-01"
    ]
  }

  terraform {
    source = "git::git@github.com:teamdigitale/io-infrastructure-modules.git//azurerm_dns_zone_records_prod_io_italia_it"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

# Azure DNS zone records module variables
dns_zone_suffix                = "prod.io.italia.it"

# Kubernetes specific variables start
aks_cluster_name               = "k8s-01"
kubernetes_public_ip_name      = "ag-to-k8s-01"
kubernetes_cname_records       = [
  "api.pa-onboarding",
  "spid-testenv",
  "app-backend",
  "app-backend-rc",
  "pa-onboarding",
  "backend.developer",
  "developer"
]
# Kubernetes specific variables end

# Onboarding records

onboarding_cname_records = [
  "onboarding",
  "logos"
]
onboarding_cname_records_targets = [
  "io-prod-cdn-endpoint-obfrontend.azureedge.net", 
  "io-prod-cdn-endpoint-oblogos.azureedge.net"
]
