output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "oidc_issuer_url" {
  value = module.eks.cluster_oidc_issuer_url
}

output "oidc_provider_arn" {
  value = module.eks.oidc_provider_arn
}


