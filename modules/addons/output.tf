output "efs_storage_class" {
  description = "EFS Kubernetes StorageClass"
  value       = kubernetes_storage_class_v1.efs.metadata[0].name
}

output "argocd_release_name" {
  description = "Argo CD Helm release name"
  value       = helm_release.argocd.name
}

output "aws_load_balancer_controller_release" {
  description = "AWS Load Balancer Controller Helm release"
  value       = helm_release.aws_load_balancer_controller.name
}