resource "kubernetes_cluster_role_binding" "eks_admin_binding" {
  metadata {
    name = "${var.admin_sa_name}-binding"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.eks_admin_sa.metadata[0].name
    namespace = kubernetes_service_account.eks_admin_sa.metadata[0].namespace
  }
}

resource "kubernetes_cluster_role_binding" "eks_read_only_binding" {
  metadata {
    name = "${var.read_only_sa_name}-binding"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "view"
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.eks_read_only_sa.metadata[0].name
    namespace = kubernetes_service_account.eks_read_only_sa.metadata[0].namespace
  }
}