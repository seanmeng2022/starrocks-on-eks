resource "helm_release" "starrocks_operator" {

  name                       = "starrocks-community"
  repository                 = local.starrocks_operator_repository
  chart                      = "kube-starrocks"
  namespace                  = "starrocks"
  create_namespace           = true

  wait = true

  depends_on = [module.eks]
  
  values = [
    templatefile("${path.module}/helm-values/starrocks-values.yaml", {
      fe_replicas = var.fe_count
      be_replicas = var.be_count
      })
    ]
}
