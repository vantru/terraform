variable "aws_region" {
  default = "ap-southeast-2"
  type = string
  description = "region of AWS"
}

# Logical environment name (used in tags and resource names)
variable "environment_name" {
  default = "dev"
  type = string
  description = "Environment name used in tags and resource names"
}

#Bussiness unit or department (used in tags and naming)
variable "Bussiness_devision" {
  default = "retail"
  type = string
  description = "Bussiness deviation in the large organization this infrastructure belongs to"

}
#--------------------------
#EKS Cluster Configuration
#--------------------------

variable "Cluster_name" {
  default = "eksdemo"
  type = string
  description = "The name of Eks cluster. Also used as a prefix in names of related resources."
}

variable "cluster_version" {
  default = null
  type = string
  description = "Kubenetes minor version to use for the EKS cluster (1.28, 1.29)"
}

# CIDR block used for kubernetes service networking
variable "cluster_service_ipv4_cidr" {
  default = null
  type = string
  description = "Service CIDR range for kubernetes services. optional - leave null to use aws default"
}

#Enable access to the EKS API via private endpoint
variable "cluster_endpoint_private_access" {
  default = false
  type = bool
  description = "Whether to enable private access to EKS control plane endpoint"
}

#Enable access to the EKS API via public endpoint
variable "cluster_endpoint_public_access" {
  default = true
  type = bool
  description = "whether to enable public access to EKS control plane endpoint"
}

variable "cluster_endpoint_public_access_cidrs" {
  default = ["0.0.0.0/0"]
  type = list(string)
  description = "List of CIDR block allowed to access public EKS endpoint"
}
#--------------------------
# Common Tags
#--------------------------

# Tags applied to all resources created by this configuration
variable "tags" {
  default = {
    Terraform = "true"
  }
  type = map(string)
  description = "Tags to apply to EKS and related resources"
}

#--------------------------
# Node Group configuration
#--------------------------

# EC2 instance type for worker nodes
variable "node_instance_types" {
  default = ["t3.medium"]
  type = list(string)
  description = "List of EC2 instance types for the node group"
}

# Capacity type for node group (ON_DEMAND or SPOT)
variable "node_capacity_type" {
  default = "ON_DEMAND"
  type = string
  description = "Instance capacity type: ON_DEMAND or SPOT"
}

# Root volume size for worker nodes
variable "node_disk_size" {
  default = 20
  type = number
  description = "Disk size in GiB for woker nodes"
}