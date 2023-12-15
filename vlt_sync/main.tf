
variable "human_name" {
  description = "A human-readable name for the variable set name & description."
  type        = string
}

variable "vlt_app" {
  description = "The HCP Vault Secrets app holding the wanted credentials."
  type        = string
}

data "hcp_vault_secrets_app" "vlt_app" {
  app_name = var.vlt_app
}

resource "tfe_variable_set" "credentials" {
  name        = "[AUTOMATION] ${var.human_name}"
  description = "The variables in this set are for ${var.human_name}. They are synced from HCP Vault Secrets and managed through a TFC workspace."
  global      = true
}

resource "tfe_variable" "values" {
  for_each = nonsensitive(data.hcp_vault_secrets_app.vlt_app.secrets)

  key             = each.key
  value           = data.hcp_vault_secrets_app.vlt_app.secrets[each.key]
  category        = "env"
  sensitive       = true
  variable_set_id = tfe_variable_set.credentials.id
}
