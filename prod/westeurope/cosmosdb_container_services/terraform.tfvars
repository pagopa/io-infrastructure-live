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
documentdb_name       = "db-01"
container_name        = "services"
container_throughput  = 1000
partitionKey_paths    = ["/serviceId"]
includedPaths         = [{
  path    = "/*"
  indexes = [
    {
      kind      = "Range"
      dataType  = "Number"
      precision = -1
    },
    {
      kind      = "Hash"
      dataType  = "String"
      precision = 3
    },
  ]
}]
