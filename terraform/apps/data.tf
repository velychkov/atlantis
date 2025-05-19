data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "velychkov-k8s"
    key    = "eks/terraform.tfstate"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "velychkov-k8s"
    key    = "vpc/terraform.tfstate"
    region = "eu-west-1"
  }
}

data "aws_eks_cluster" "this" {
  name = data.terraform_remote_state.eks.outputs.eks_cluster_name
}

data "aws_eks_cluster_auth" "this" {
  name = data.terraform_remote_state.eks.outputs.eks_cluster_name
}

data "aws_iam_openid_connect_provider" "oidc_issuer_url" {
  url = data.terraform_remote_state.eks.outputs.oidc_issuer_url
}

data "aws_iam_openid_connect_provider" "oidc_provider_arn" {
  arn = data.terraform_remote_state.eks.outputs.oidc_provider_arn
}