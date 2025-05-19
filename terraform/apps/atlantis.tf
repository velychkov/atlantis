resource "helm_release" "atlantis" {
  name       = "atlantis"
  repository = "https://runatlantis.github.io/helm-charts"
  chart      = "atlantis"
  namespace  = "default"
  values     = [
    templatefile("${path.module}/values-atlantis.yaml", {
    })
  ]
}