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

data "hcp_vault_secrets_app" "tfc" {
  app_name = var.vlt_app_for_tfc_credentials
}

provider "tfe" {
  token        = data.hcp_vault_secrets_app.tfc.secrets["TFE_TOKEN"]
  organization = var.tfc_organization
}

module "azure" {
  source = "./vlt_sync"

  human_name = "Azure Access"
  vlt_app    = var.vlt_app_for_azure_credentials
}

module "tfc" {
  source = "./vlt_sync"

  human_name = "Terraform Cloud Access"
  vlt_app    = var.vlt_app_for_tfc_credentials
}

module "github" {
  source = "./vlt_sync"

  human_name = "GitHub Access"
  vlt_app    = var.vlt_app_for_github_credentials
}
