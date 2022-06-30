resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
}

resource "vault_kubernetes_auth_backend_config" "kubernetes" {
  backend                = vault_auth_backend.kubernetes.path
  kubernetes_host        = "https://kubernetes.default.svc.cluster.local"
  kubernetes_ca_cert     = var.vault.kubernetes_ca_cert
  token_reviewer_jwt     = data.kubernetes_secret.vault.data.token
  issuer                 = var.vault.kubernetes_issuer
  disable_iss_validation = var.vault.disable_iss_validation
}

resource "vault_github_auth_backend" "github" {
  organization = var.github_organization
}

resource "vault_github_team" "teams" {
  backend  = vault_github_auth_backend.github.id
  for_each = var.github_roles_teams
  team     = each.key
  policies = each.value
}

resource "vault_github_user" "github" {
  backend  = vault_github_auth_backend.github.id
  for_each = var.github_roles_users
  user     = each.key
  policies = each.value
}

resource "vault_policy" "policy" {
  for_each = var.policies
  name     = each.key
  policy   = each.value
}

resource "vault_mount" "mounts" {
  for_each = var.mounts
  path     = each.value.path
  type     = each.value.type
  options  = lookup(each.value, "options", null)
}

resource "vault_kubernetes_auth_backend_role" "kubernetes" {
  backend                          = lookup(each.value, "backend", vault_auth_backend.kubernetes.path)
  for_each                         = var.kubernetes_roles
  role_name                        = each.key
  bound_service_account_names      = each.value.bound_service_account_names
  bound_service_account_namespaces = each.value.bound_service_account_namespaces
  token_policies                   = each.value.token_policies
  depends_on                       = [vault_policy.policy]
}

resource "vault_generic_secret" "secret" {
  for_each   = var.secrets
  path       = each.key
  data_json  = each.value
  depends_on = [vault_mount.mounts]
}

resource "vault_audit" "audit" {
  type  = "file"
  path  = "vault_audit"
  local = false
  options = {
    file_path = "stdout"
  }
}

## Additionals auth backend configurations to plug other clusters

resource "vault_auth_backend" "auth_backends" {
  for_each = var.auth_backends
  type     = each.value.type
  path     = "${each.value.type}-${each.key}"
}

resource "vault_kubernetes_auth_backend_config" "kubernetes_configs" {
  for_each               = { for k, v in var.auth_backends : k => v if v.type == "kubernetes" }
  backend                = vault_auth_backend.auth_backends[each.key].path
  kubernetes_host        = each.value.kubernetes_host
  kubernetes_ca_cert     = each.value.kubernetes_ca_cert
  token_reviewer_jwt     = each.value.token_reviewer_jwt
  issuer                 = each.value.issuer
  disable_iss_validation = each.value.disable_iss_validation
}
