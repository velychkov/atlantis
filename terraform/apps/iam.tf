data "aws_iam_policy_document" "alb_ingress" {
  statement {
    effect = "Allow"
    principals {
      type        = "Federated"
      identifiers = [data.aws_iam_openid_connect_provider.oidc_provider_arn.arn]
    }

    actions = ["sts:AssumeRoleWithWebIdentity"]

    condition {
      test     = "StringEquals"
      variable = "${data.aws_iam_openid_connect_provider.oidc_issuer_url.url}:sub"
      values   = [
        "system:serviceaccount:kube-system:aws-load-balancer-controller"
      ]
    }
  }
}

data "aws_iam_policy_document" "eks_assume_role" {
  statement {
    effect = "Allow"
    principals {
      type        = "Federated"
      identifiers = [data.aws_iam_openid_connect_provider.oidc_provider_arn.arn]
    }

    actions = ["sts:AssumeRoleWithWebIdentity"]

    condition {
      test     = "StringEquals"
      variable = "${data.aws_iam_openid_connect_provider.oidc_issuer_url.url}:sub"
      values   = [
        "system:serviceaccount:kube-system:eks-admin",
        "system:serviceaccount:kube-system:eks-read-only"
      ]
    }
  }
}

resource "aws_iam_role" "eks_admin" {
  name               = "${var.admin_sa_name}-role"
  assume_role_policy = data.aws_iam_policy_document.eks_assume_role.json
}

resource "aws_iam_role" "eks_read_only" {
  name               = "${var.read_only_sa_name}-role"
  assume_role_policy = data.aws_iam_policy_document.eks_assume_role.json
}

resource "aws_iam_role" "alb_ingress" {
  name               = "alb-ingress-controller"
  assume_role_policy = data.aws_iam_policy_document.alb_ingress.json
}