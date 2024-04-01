variable "hcp_project_uuid" {
  description = "The default HCP project UUID that resources should belong to."
  type        = string
}

variable "tfc_organization" {
  description = "The default TFC organization that resources should belong to."
  type        = string
}

variable "vlt_app_for_tfc_credentials" {
  description = "The HCP Vault Secrets app holding all Terraform Cloud credentials."
  type        = string
}

variable "vlt_app_for_azure_credentials" {
  description = "The HCP Vault Secrets app holding all Azure credentials."
  type        = string
}

variable "vlt_app_for_github_credentials" {
  description = "The HCP Vault Secrets app holding all GitHub credentials."
  type        = string
}
