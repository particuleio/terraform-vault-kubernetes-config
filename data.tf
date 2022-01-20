data "kubernetes_secret" "vault" {
  metadata {
    name      = data.kubernetes_service_account.vault.default_secret_name
    namespace = data.kubernetes_service_account.vault.metadata.0.namespace
  }
}

data "kubernetes_service_account" "vault" {
  metadata {
    name      = var.vault.service_account_name
    namespace = var.vault.service_account_namespace
  }
}
