#-------------------------------
# Public subnet tags for EKS Load Balancer Support
#-------------------------------

resource "aws_ec2_tag" "eks_subnet_tag_public_elb" {
  for_each = toset(data.terraform_remote_state.vpc.outputs.public_subnets_ids)
  resource_id = each.value
  key = "kubernetes.io/role/elb"
  value = "1"
}

resource "aws_ec2_tag" "eks_subnet_tag_public_cluster" {
  for_each = toset(data.terraform_remote_state.vpc.outputs.public_subnets_ids)
  resource_id = each.value
  key = "kubernetes.io/cluster/${locals.eks_cluster_name}"
  value = "shared"
}

#-----------------------------------------------------
# Private subnet Tags for EKS Internal LoadBalancer Support
#-----------------------------------------------------
resource "aws_ec2_tag" "eks_subnet_tag_private_elb" {
  for_each = toset(data.terraform_remote_state.vpc.outputs.private_subnets_ids)
  resource_id = each.value
  key = "kubernetes.io/role/internal-elb"
  value = "1"
}

resource "aws_ec2_tag" "eks_subnet_tag_private_cluster" {
  for_each = toset(data.terraform_remote_state.vpc.outputs.private_subnets_ids)
  resource_id = each.value
  key = "kubernetes.io/cluster/${locals.eks_cluster_name}"
  value = "shared"
}