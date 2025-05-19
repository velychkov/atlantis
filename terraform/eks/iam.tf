# data "aws_iam_policy_document" "eks_assume_role" {
#   statement {
#     effect = "Allow"
#     principals {
#       type        = "Federated"
#       identifiers = [module.eks.oidc_provider_arn]
#     }

#     actions = ["sts:AssumeRoleWithWebIdentity"]

#     condition {
#       test     = "StringEquals"
#       variable = "${module.eks.cluster_oidc_issuer_url}:sub"
#       values   = [
#         "system:serviceaccount:kube-system:eks-admin",
#         "system:serviceaccount:kube-system:eks-read-only"
#       ]
#     }
#   }
# }

# resource "aws_iam_role" "eks_admin" {
#   name               = "${var.admin_sa_name}-role"
#   assume_role_policy = data.aws_iam_policy_document.eks_assume_role.json
# }

# resource "aws_iam_role" "eks_read_only" {
#   name               = "${var.read_only_sa_name}-role"
#   assume_role_policy = data.aws_iam_policy_document.eks_assume_role.json
# }

# resource "aws_iam_role_policy_attachment" "eks_admin_attach" {
#   role       = aws_iam_role.eks_admin.name
#   policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
# }

# resource "aws_iam_role_policy_attachment" "eks_read_only_attach" {
#   role       = aws_iam_role.eks_read_only.name
#   policy_arn = "arn:aws:iam::aws:policy/job-function/ViewOnlyAccess"
# }