variable kubectl_config_context_name {
  default = "kubernetes0-admin@kubernetes0"
}

variable kubectl_config_path {
  default = "~/.kube/custom-contexts/k0admin/admin.yml"
}

variable name_of_ns {
  default = "my-first-tf-namespace"
}
