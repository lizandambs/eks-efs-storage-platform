module "vpc" {
  source = "./modules/vpc"

  project_name = var.project_name
  environment  = var.environment
  vpc_cidr     = var.vpc_cidr
}

module "eks" {
  source = "./modules/eks"

  cluster_name       = var.cluster_name
  kubernetes_version = var.kubernetes_version

  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets

  project_name = var.project_name
  environment  = var.environment
}

module "efs" {
  source = "./modules/efs"

  project_name           = var.project_name
  environment            = var.environment
  vpc_id                 = module.vpc.vpc_id
  private_subnets        = module.vpc.private_subnets
  node_security_group_id = module.eks.node_security_group_id

  depends_on = [
    module.eks
  ]
}

module "iam" {
  source = "./modules/iam"

  project_name = var.project_name
  environment  = var.environment
  cluster_name = module.eks.cluster_name

  depends_on = [
    module.eks,
    module.efs
  ]
}

module "addons" {
  source = "./modules/addons"

  cluster_name     = module.eks.cluster_name
  cluster_endpoint = module.eks.cluster_endpoint
  cluster_ca_data  = module.eks.cluster_certificate_authority_data

  aws_region = var.aws_region
  vpc_id     = module.vpc.vpc_id

  efs_file_system_id = module.efs.file_system_id

  depends_on = [
    module.eks,
    module.efs,
    module.iam
  ]
}