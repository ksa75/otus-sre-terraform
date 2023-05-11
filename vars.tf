variable "kubectl_config_context_name" {
  type    = string
  default = "kubernetes0-admin@kubernetes0"
}

variable "kubectl_config_path" {
  type    = string
  default = "~/.kube/custom-contexts/k0admin/admin.yml"
}

variable "name_of_ns" {
  type    = string
  default = "my-first-tf-namespace"
}

variable "resource_quotas" {
  type = map(any)
}

variable "rolebinds" {
  type = map(any)
}

variable "roles" {
  type = map(any)
}
