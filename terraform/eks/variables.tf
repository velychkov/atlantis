variable "region" {
  type    = string
}

variable "cluster_name" {
  type    = string
}

variable "cluster_version" {
  type    = string
}

variable "bootstrap_self_managed_addons" {
  type    = bool
}

variable "cluster_addons" {
  type    = any
}

variable "cluster_endpoint_public_access" {
  type    = bool
}

variable "enable_cluster_creator_admin_permissions" {
  type    = bool
}

variable "eks_managed_node_group_defaults_instance_types" {
  type    = list(string)
}

variable "eks_managed_node_groups" {
  description = "Map of EKS managed node group configurations"
  type = map(object({
    ami_type       = string
    instance_types = list(string)
    min_size       = number
    max_size       = number
    desired_size   = number
  }))
}

variable "tags" {
  type    = map(string)
}

variable "admin_sa_name" {
  type    = string
}

variable "read_only_sa_name" {
  type    = string
}