output "ns_name" {
 value = kubernetes_namespace.ns.id
}

output "ns_uid" {
 value = kubernetes_namespace.ns.metadata[0].uid
}
