dependency "resource_group" {
  config_path = "../../resource_group"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

terraform {
  source = "git::git@github.com:pagopa/io-infrastructure-modules-new.git//azurerm_storage_account?ref=v0.0.23"
}

inputs = {
  name                     = "cdnassets"
  resource_group_name      = dependency.resource_group.outputs.resource_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier              = "Hot"
}
