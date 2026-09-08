variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for EFS"
  type        = string
}

variable "private_subnets" {
  description = "Private subnet IDs for EFS mount targets"
  type        = list(string)
}

variable "node_security_group_id" {
  description = "EKS node security group ID"
  type        = string
}