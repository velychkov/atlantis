resource "kubernetes_service_account" "alb_sa" {
  metadata {
    name      = "aws-load-balancer-controller"
    namespace = "kube-system"
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.alb_ingress.arn
    }
  }
  automount_service_account_token = true
}

resource "kubernetes_service_account" "eks_admin_sa" {
  metadata {
    name      = var.admin_sa_name
    namespace = "default"
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.eks_admin.arn
    }
  }
}

resource "kubernetes_service_account" "eks_read_only_sa" {
  metadata {
    name      = var.read_only_sa_name
    namespace = "default"
    annotations = {
      "eks.amazonaws.com/role-arn" = aws_iam_role.eks_read_only.arn
    }
  }
}