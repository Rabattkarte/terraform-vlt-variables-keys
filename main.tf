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
  # Configuration options
  project_id = var.hcp_project_uuid
}

provider "tfe" {
  # Configuration options
  token        = data.hcp_vault_secrets_secret.tfc_credentials.secret_value
  organization = var.tfc_organization
}

variable "hcp_project_uuid" {
  description = "The default HCP project UUID that resources should belong to."
  type        = string
}

variable "tfc_organization" {
  description = "The default TFC organization that resources should belong to."
  type        = string
}

data "hcp_vault_secrets_secret" "tfc_credentials" {
  app_name    = "TFC--hashi-nils-org"
  secret_name = "TFE_TOKEN"
}

data "hcp_vault_secrets_app" "doormat_credentials" {
  app_name = "doormat-credentials-azure"
}

resource "tfe_variable_set" "azure" {
  name        = "[AUTOMATION] Azure Credentials"
  description = "The variables in this set allow access to a Doormat Azure account. They are synced from HCP Vault Secrets and managed through a TFC workspace."
  global      = true
}

resource "tfe_variable" "azure_vars" {
  for_each = nonsensitive(data.hcp_vault_secrets_app.doormat_credentials.secrets)

  key             = each.key
  value           = data.hcp_vault_secrets_app.doormat_credentials.secrets[each.key]
  category        = "env"
  sensitive       = true
  variable_set_id = tfe_variable_set.azure.id
}
