region = "eu-west-1"

cluster_name    = "my-cluster"
cluster_version = "1.31"

bootstrap_self_managed_addons = true
cluster_addons = {
  coredns                = {}
  eks-pod-identity-agent = {}
  kube-proxy             = {}
  vpc-cni                = {}
}

cluster_endpoint_public_access = true
enable_cluster_creator_admin_permissions = true

eks_managed_node_group_defaults_instance_types = ["t3a.micro", "t3a.small", "t3a.medium"]

eks_managed_node_groups = {
  ng-system = {
    ami_type       = "AL2023_x86_64_STANDARD"
    instance_types = ["t3a.medium"]
    min_size       = 1
    max_size       = 2
    desired_size   = 1
  }
}

tags = {
Environment = "dev"
Terraform   = "true"
}

admin_sa_name = "eks-admin"
read_only_sa_name = "eks-read-only"
