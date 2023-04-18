provider "kubernetes" {
  config_context = var.kubectl_config_context_name
  config_path    = var.kubectl_config_path
}

resource "kubernetes_namespace" "ns" {
  metadata {
    name = var.name_of_ns
  }
}

