# terraform-vault-kubernetes-config

Module to configure and manage Vault configuration on Kubernetes

## Usage


### Examples

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~> 2.0 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | ~> 2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_audit.audit](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/audit) | resource |
| [vault_auth_backend.auth_backends](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/auth_backend) | resource |
| [vault_auth_backend.kubernetes](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/auth_backend) | resource |
| [vault_generic_secret.secret](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_secret) | resource |
| [vault_github_auth_backend.github](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/github_auth_backend) | resource |
| [vault_github_team.teams](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/github_team) | resource |
| [vault_github_user.github](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/github_user) | resource |
| [vault_kubernetes_auth_backend_config.kubernetes](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/kubernetes_auth_backend_config) | resource |
| [vault_kubernetes_auth_backend_config.kubernetes_configs](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/kubernetes_auth_backend_config) | resource |
| [vault_kubernetes_auth_backend_role.kubernetes](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/kubernetes_auth_backend_role) | resource |
| [vault_mount.mounts](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/mount) | resource |
| [vault_policy.policy](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [kubernetes_secret.vault](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/secret) | data source |
| [kubernetes_service_account.vault](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/service_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auth_backends"></a> [auth\_backends](#input\_auth\_backends) | n/a | `any` | `{}` | no |
| <a name="input_cluster-name"></a> [cluster-name](#input\_cluster-name) | n/a | `any` | n/a | yes |
| <a name="input_github_roles_teams"></a> [github\_roles\_teams](#input\_github\_roles\_teams) | n/a | `any` | `{}` | no |
| <a name="input_github_roles_users"></a> [github\_roles\_users](#input\_github\_roles\_users) | n/a | `any` | `{}` | no |
| <a name="input_kubernetes_roles"></a> [kubernetes\_roles](#input\_kubernetes\_roles) | n/a | `any` | `{}` | no |
| <a name="input_mounts"></a> [mounts](#input\_mounts) | n/a | `any` | `{}` | no |
| <a name="input_policies"></a> [policies](#input\_policies) | n/a | `map(any)` | `{}` | no |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | n/a | `any` | `{}` | no |
| <a name="input_vault"></a> [vault](#input\_vault) | n/a | `any` | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
