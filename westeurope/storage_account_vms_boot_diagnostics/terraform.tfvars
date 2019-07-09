terragrunt = {
  dependencies {
    paths = [
      "../subnet_mgmt"
    ]
  }

  terraform {
    source = "git::git@github.com:teamdigitale/io-infrastructure-modules.git//azurerm_storage_account"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

# Storage account module related variables
storage_account_name                             = "bootdiagnostics"
azurerm_storage_account_account_tier             = "Standard"
azurerm_storage_account_account_replication_type = "LRS"
set_firewall                                     = false
