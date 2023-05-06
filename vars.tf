variable kubectl_config_context_name {
  default = "kubernetes0-admin@kubernetes0"
}

variable kubectl_config_path {
  default = "~/.kube/custom-contexts/k0admin/admin.yml"
}

variable name_of_ns {
  default = "my-first-tf-namespace"
}

# variable resource_quotas_hard {
# }
# 
# variable resource_quotas_scopes {
# }

variable resource_quotas {
  type = map  
}

# variable resource_quotas_scopeSelector {
# }

variable rolebinds {
  type = map
}

variable roles {
  type = map
}
