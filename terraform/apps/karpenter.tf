resource "helm_release" "karpenter" {
  name             = "karpenter"
  repository       = "https://charts.karpenter.sh"
  chart            = "karpenter"
  namespace        = "default"
  create_namespace = false

  set {
    name  = "clusterName"
    value = "my-cluster"
  }

  set {
    name  = "clusterEndpoint"
    value = "https://B735A2BBDBF7B0E2480D602A78FEFE64.gr7.eu-west-1.eks.amazonaws.com"
  }

  set {
    name  = "aws.defaultInstanceProfile"
    value = "KarpenterNodeInstanceProfile"
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.karpenter.arn
  }
}

# resource "kubernetes_manifest" "karpenter_nodepool" {
#   manifest = {
#     "apiVersion" = "karpenter.sh/v1alpha5"
#     "kind"       = "Provisioner"
#     "metadata" = {
#       "name"      = "default"
#     }
#     "spec" = {
#       "requirements" = [
#         {
#           "key"      = "node.kubernetes.io/instance-type"
#           "operator" = "In"
#           "values"   = ["t3a.micro", "t3a.small", "t3a.medium"]
#         },
#         {
#           "key"      = "topology.kubernetes.io/zone"
#           "operator" = "In"
#           "values"   = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
#         },
#         {
#           "key"      = "kubernetes.io/arch"
#           "operator" = "In"
#           "values"   = ["amd64"]
#         }
#       ]
#       "provider" = {
#         "instanceProfile" = "KarpenterNodeInstanceProfile"
#         "subnetSelector" = {
#           "karpenter.sh/discovery" = data.aws_eks_cluster.this.name
#         }
#       }
#       "ttlSecondsAfterEmpty" = 30
#     }
#   }
# }