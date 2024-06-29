locals {

  azs = slice(data.aws_availability_zones.available.names, 0, 3)

  starrocks_operator_name       = "starrocks-community"
  starrocks_operator_repository = "https://starrocks.github.io/starrocks-kubernetes-operator"

  # Get starocks fe pod IP
  starrocks_fe_pod_ips = [
    for i in range(var.fe_count) : data.kubernetes_resources.starrocks_fe_pods[i].objects[0].status.podIP
  ]

  # Get starocks be pod IP
  starrocks_be_pod_ips = [
    for i in range(var.be_count) : data.kubernetes_resources.starrocks_be_pods[i].objects[0].status.podIP
  ]

  starrocks_fe_targets = formatlist("%s:8030", local.starrocks_fe_pod_ips)
  starrocks_be_targets = formatlist("%s:8040", local.starrocks_be_pod_ips)

}