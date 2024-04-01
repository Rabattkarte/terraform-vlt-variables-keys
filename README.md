# terraform-vlt-variables-keys

Sync [HCP Vault Secrets](https://developer.hashicorp.com/hcp/docs/vault-secrets) Apps to sensitive Variable Sets in Terraform Cloud to enable access to clouds, APIs, etc.

---

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_hcp"></a> [hcp](#requirement\_hcp) | 0.75.0 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | 0.49.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcp"></a> [hcp](#provider\_hcp) | 0.75.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure"></a> [azure](#module\_azure) | ./vlt_sync | n/a |
| <a name="module_github"></a> [github](#module\_github) | ./vlt_sync | n/a |
| <a name="module_tfc"></a> [tfc](#module\_tfc) | ./vlt_sync | n/a |

## Resources

| Name | Type |
|------|------|
| [hcp_vault_secrets_app.tfc](https://registry.terraform.io/providers/hashicorp/hcp/0.75.0/docs/data-sources/vault_secrets_app) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hcp_project_uuid"></a> [hcp\_project\_uuid](#input\_hcp\_project\_uuid) | The default HCP project UUID that resources should belong to. | `string` | n/a | yes |
| <a name="input_tfc_organization"></a> [tfc\_organization](#input\_tfc\_organization) | The default TFC organization that resources should belong to. | `string` | n/a | yes |
| <a name="input_vlt_app_for_azure_credentials"></a> [vlt\_app\_for\_azure\_credentials](#input\_vlt\_app\_for\_azure\_credentials) | The HCP Vault Secrets app holding all Azure credentials. | `string` | n/a | yes |
| <a name="input_vlt_app_for_github_credentials"></a> [vlt\_app\_for\_github\_credentials](#input\_vlt\_app\_for\_github\_credentials) | The HCP Vault Secrets app holding all GitHub credentials. | `string` | n/a | yes |
| <a name="input_vlt_app_for_tfc_credentials"></a> [vlt\_app\_for\_tfc\_credentials](#input\_vlt\_app\_for\_tfc\_credentials) | The HCP Vault Secrets app holding all Terraform Cloud credentials. | `string` | n/a | yes |

## Outputs

No outputs.
