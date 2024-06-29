data "aws_availability_zones" "available" {}


data "aws_eks_cluster_auth" "this" {
  name = module.eks.cluster_name
}

data "aws_caller_identity" "current" {}


# Get starrocks fe_pod infomation
data "kubernetes_resources" "starrocks_fe_pods" {
  count          = var.fe_count
  api_version    = "v1"
  kind           = "Pod"
  namespace      = "starrocks"
  label_selector = "statefulset.kubernetes.io/pod-name=kube-starrocks-fe-${count.index}"

  depends_on = [resource.helm_release.starrocks_operator]
}

# Get starrocks be_pod infomation
data "kubernetes_resources" "starrocks_be_pods" {
  count          = var.be_count
  api_version    = "v1"
  kind           = "Pod"
  namespace      = "starrocks"
  label_selector = "statefulset.kubernetes.io/pod-name=kube-starrocks-be-${count.index}"

  depends_on = [resource.helm_release.starrocks_operator]
}