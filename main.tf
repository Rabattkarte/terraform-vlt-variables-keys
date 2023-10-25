terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.75.0"
    }

    tfe = {
      source  = "hashicorp/tfe"
      version = "0.49.2"
    }
  }
}

provider "hcp" {
  project_id = var.hcp_project_uuid
}

provider "tfe" {
  token        = data.hcp_vault_secrets_app.tfc_credentials.secrets["TFE_TOKEN"]
  organization = var.tfc_organization
}

data "hcp_vault_secrets_app" "tfc_credentials" {
  app_name = var.vlt_app_for_tfc_credentials
}

data "hcp_vault_secrets_app" "doormat_credentials_azure" {
  app_name = var.vlt_app_for_azure_credentials
}

resource "tfe_variable_set" "azure" {
  name        = "[AUTOMATION] Azure Credentials"
  description = "The variables in this set allow access to a Doormat Azure account. They are synced from HCP Vault Secrets and managed through a TFC workspace."
  global      = true
}

resource "tfe_variable" "azure_vars" {
  for_each = nonsensitive(data.hcp_vault_secrets_app.doormat_credentials_azure.secrets)

  key             = each.key
  value           = data.hcp_vault_secrets_app.doormat_credentials_azure.secrets[each.key]
  category        = "env"
  sensitive       = true
  variable_set_id = tfe_variable_set.azure.id
}

resource "tfe_variable_set" "tfc" {
  name        = "[AUTOMATION] TFC Credentials"
  description = "The variables in this set allow access to a TFC organization. They are synced from HCP Vault Secrets and managed through a TFC workspace."
  global      = true
}

resource "tfe_variable" "tfc_vars" {
  for_each = nonsensitive(data.hcp_vault_secrets_app.tfc_credentials.secrets)

  key             = each.key
  value           = data.hcp_vault_secrets_app.tfc_credentials.secrets[each.key]
  category        = "env"
  sensitive       = true
  variable_set_id = tfe_variable_set.tfc.id
}
