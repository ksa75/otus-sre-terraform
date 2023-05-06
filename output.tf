output "ns_name" {
 value = kubernetes_namespace.ns.id
}

output "ns_uid" {
 value = kubernetes_namespace.ns.metadata[0].uid
}


output "roles" {
 value = kubernetes_role.role
 }

 output "rolebinds" {
 value = kubernetes_role_binding.rolebind
 }

output "quotas" {
value = kubernetes_resource_quota.quota
}


