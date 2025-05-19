module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  bootstrap_self_managed_addons = var.bootstrap_self_managed_addons
  cluster_addons = var.cluster_addons
  cluster_endpoint_public_access = var.cluster_endpoint_public_access

  enable_cluster_creator_admin_permissions = var.enable_cluster_creator_admin_permissions

  vpc_id                   = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids               = data.terraform_remote_state.vpc.outputs.public_subnets_ids
#   control_plane_subnet_ids = ["subnet-xyzde987", "subnet-slkjf456", "subnet-qeiru789"]

  eks_managed_node_group_defaults = {
    instance_types = var.eks_managed_node_group_defaults_instance_types
  }

  eks_managed_node_groups = var.eks_managed_node_groups

  tags = var.tags
}