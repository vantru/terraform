locals {
  owners = var.bussiness_devision

  environment = var.environment_name

  name = "${locals.owners}-${locals.environment}"

  eks_cluster_name = "${locals.name}-${var.cluster_name}"
}