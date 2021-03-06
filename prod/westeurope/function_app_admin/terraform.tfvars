# Creates a Kubernetes Cluster through AKS using the Kubenet CNI.
# For more info look at the README.md file of the module.

terragrunt = {
  dependencies {
    paths = [
      "../function_app_service_plan_fn2admin",
      "../cosmosdb_account_01",
      "../storage_account_appdata",
      "../storage_account_fn2admin"
    ]
  }

  terraform {
    source = "git::git@github.com:teamdigitale/io-infrastructure-modules.git//azurerm_function_app"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

plan_name            = "fn2admin"
storage_account_name = "fn2admin"
functionapp_name     = "2-admin"

functionapp_settings = [
  {
    name  = "COSMOSDB_NAME"
    value = "io-prod-sqldb-db-01"
  },
  {
    name = "LOGOS_URL",
    value = "https://assets.io.italia.it"
  },
  {
    name  = "FUNCTION_APP_EDIT_MODE"
    value = "readonly"
  },
  {
    name  = "WEBSITE_NODE_DEFAULT_VERSION"
    value = "10.14.1"
  },
  {
    name  = "WEBSITE_RUN_FROM_PACKAGE"
    value = "1" 
  },
  {
    name  = "WEBSITE_HTTPSCALEV2_ENABLED"
    value = "1"
  },
  {
    name  = "FUNCTIONS_EXTENSION_VERSION"
    value = "~2"
  },
  {
    name  = "AZURE_APIM",
    value = "io-prod-apim-01",
  },
  {
    name  = "AZURE_APIM_HOST",
    value = "api.io.italia.it",
  },
  {
    name  = "AZURE_APIM_RESOURCE_GROUP",
    value = "io-prod-rg",
  },
  {
    name        = "ADB2C_CLIENT_ID",
    value       = "9f9b1d90-dd47-4be4-8546-800763b36fb9",
  },
  {
    name        = "ADB2C_TENANT_ID",
    value       = "agidweb.onmicrosoft.com",
  }
]

functionapp_settings_secrets = [
  {
    name        = "APPINSIGHTS_INSTRUMENTATIONKEY"
    vault_alias = "fn2-commons-app-insights-instrumentation-key"
  },
  {
    name        = "StorageConnection"
    vault_alias = "fn2-commons-sa-appdata-primary-connection-string"
  },
  {
    name        = "AssetsStorageConnection"
    vault_alias = "fn2-commons-sa-assets-primary-connection-string"
  },
  {
    name        = "SERVICE_PRINCIPAL_CLIENT_ID"
    vault_alias = "fn2-admin-service-principal-client-id"
  },
  {
    name        = "SERVICE_PRINCIPAL_SECRET"
    vault_alias = "fn2-admin-service-principal-secret"
  },
  {
    name        = "SERVICE_PRINCIPAL_TENANT_ID"
    vault_alias = "fn2-admin-service-principal-tenant-id"
  },
  {
    name        = "AZURE_SUBSCRIPTION_ID",
    vault_alias = "fn2-admin-azure-subscription-id",
  },
  {
    name        = "ADB2C_CLIENT_KEY",
    vault_alias = "fn2-admin-adb2c-client-key",
  }
]

functionapp_connection_strings = [
  {
    name        = "COSMOSDB_KEY"
    vault_alias = "fn2-commons-cosmosdb-key"
  },
  {
    name        = "COSMOSDB_URI"
    vault_alias = "fn2-commons-cosmosdb-uri"
  }
]
