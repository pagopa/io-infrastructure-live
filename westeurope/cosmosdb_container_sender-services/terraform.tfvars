terragrunt = {
  dependencies {
    paths = ["../azurerm_cosmosdb_sql_database"]
  }

  terraform {
    source = "git::git@github.com:teamdigitale/io-infrastructure-modules.git//azurerm_cosmosdb_container"
  }

  # Include all settings from the root terraform.tfvars file
  include = {
    path = "${find_in_parent_folders()}"
  }
}

# CosmosDB account specific variables
cosmosdb_account_name = "apim"

container_name = "sender-services"

partitionKey_paths = ["/recipientFiscalCode"]

includedPaths = [{
  path = "/*"

  indexes = [
    {
      kind      = "Range"
      dataType  = "number"
      precision = -1
    },
    {
      kind      = "Range"
      dataType  = "string"
      precision = -1
    },
    {
      kind     = "Spatial"
      dataType = "Point"
    },
  ]
}]