data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "velychkov-k8s"
    key    = "vpc/terraform.tfstate"
    region = "eu-west-1"
  }
}

data "aws_eks_cluster" "this" {
  name = module.eks.cluster_name
}

data "aws_eks_cluster_auth" "this" {
  name = module.eks.cluster_name
}