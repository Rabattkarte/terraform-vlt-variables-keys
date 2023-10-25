# vlt-azure-access

Enable access to Doormat Azure via HCP Vault Secrets.

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
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.49.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_variable.azure_vars](https://registry.terraform.io/providers/hashicorp/tfe/0.49.2/docs/resources/variable) | resource |
| [tfe_variable_set.azure](https://registry.terraform.io/providers/hashicorp/tfe/0.49.2/docs/resources/variable_set) | resource |
| [hcp_vault_secrets_app.doormat_credentials_azure](https://registry.terraform.io/providers/hashicorp/hcp/0.75.0/docs/data-sources/vault_secrets_app) | data source |
| [hcp_vault_secrets_secret.tfc_credentials](https://registry.terraform.io/providers/hashicorp/hcp/0.75.0/docs/data-sources/vault_secrets_secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hcp_project_uuid"></a> [hcp\_project\_uuid](#input\_hcp\_project\_uuid) | The default HCP project UUID that resources should belong to. | `string` | n/a | yes |
| <a name="input_tfc_organization"></a> [tfc\_organization](#input\_tfc\_organization) | The default TFC organization that resources should belong to. | `string` | n/a | yes |
| <a name="input_vlt_app_for_azure_credentials"></a> [vlt\_app\_for\_azure\_credentials](#input\_vlt\_app\_for\_azure\_credentials) | The HCP Vault Secrets app holding all Azure credentials. | `string` | `"doormat-credentials-azure"` | no |

## Outputs

No outputs.
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_hcp"></a> [hcp](#requirement\_hcp) | 0.75.0 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | 0.49.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcp"></a> [hcp](#provider\_hcp) | 0.75.0 |
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.49.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_variable.azure_vars](https://registry.terraform.io/providers/hashicorp/tfe/0.49.2/docs/resources/variable) | resource |
| [tfe_variable_set.azure](https://registry.terraform.io/providers/hashicorp/tfe/0.49.2/docs/resources/variable_set) | resource |
| [hcp_vault_secrets_app.doormat_credentials_azure](https://registry.terraform.io/providers/hashicorp/hcp/0.75.0/docs/data-sources/vault_secrets_app) | data source |
| [hcp_vault_secrets_secret.tfc_credentials](https://registry.terraform.io/providers/hashicorp/hcp/0.75.0/docs/data-sources/vault_secrets_secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hcp_project_uuid"></a> [hcp\_project\_uuid](#input\_hcp\_project\_uuid) | The default HCP project UUID that resources should belong to. | `string` | n/a | yes |
| <a name="input_tfc_organization"></a> [tfc\_organization](#input\_tfc\_organization) | The default TFC organization that resources should belong to. | `string` | n/a | yes |
| <a name="input_vlt_app_for_azure_credentials"></a> [vlt\_app\_for\_azure\_credentials](#input\_vlt\_app\_for\_azure\_credentials) | The HCP Vault Secrets app holding all Azure credentials. | `string` | `"doormat-credentials-azure"` | no |

## Outputs

No outputs.
