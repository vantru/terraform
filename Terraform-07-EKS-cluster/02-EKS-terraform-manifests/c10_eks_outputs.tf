

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.main.endpoint
  description = "EKS API server endpoint"
}

output "eks_cluster_id" {
  description = "the name/id of the EKS cluster"
  value = aws_eks_cluster.main.id
}

output "eks_cluster_version" {
  value = aws_eks_cluster.main.version
  description = "EKS kubernetes version"
}

output "eks_cluster_name" {
  value = aws_eks_cluster.main.name
  description = "EKS cluster name"
}

output "eks_cluster_certificate_authority_data" {
  value = aws_eks_cluster.main.certificate_authority[0].data
  description = "Base64 encoded CA certificate for Kubectl config"
}

output "private_node_group_name" {
  value = aws_eks_node_group.private_nodes.node_group_name
  description = "Name of the EKS private node group"
}

output "eks_node_instance_role_arn" {
  value = aws_iam_role.eks_nodegroup_role.arn
  description = "IAM Role ARN used by EKS node group (EC2 worker node)"
}

output "to_configure_kubectl" {
  value = "aws eks --region ${var.aws_region} update-kubeconfig --name ${locals.eks_cluster_name}"
  description = "Command to update local kubeconfig to conect to the EKS cluster"
}