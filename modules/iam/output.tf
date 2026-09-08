output "efs_csi_role_arn" {
  description = "IAM role ARN for EFS CSI driver"
  value       = module.efs_csi_pod_identity.iam_role_arn
}

output "aws_lbc_role_arn" {
  description = "IAM role ARN for AWS Load Balancer Controller"
  value       = module.aws_lbc_pod_identity.iam_role_arn
}