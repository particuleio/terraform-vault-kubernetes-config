variable "vault" {
  type    = any
  default = {}
}

variable "policies" {
  type    = map(any)
  default = {}
}

variable "mounts" {
  type    = any
  default = {}
}

variable "secrets" {
  type    = any
  default = {}
}

variable "kubernetes_roles" {
  type    = any
  default = {}
}

variable "github_roles_teams" {
  type    = any
  default = {}
}

variable "github_roles_users" {
  type    = any
  default = {}
}

variable "cluster-name" {}

variable "auth_backends" {
  type    = any
  default = {}
}
