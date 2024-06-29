variable "name" {
  description = "Name of the VPC and EKS Cluster"
  default     = "starrocks-on-eks-demo-0625-v1"
  type        = string
}

variable "region" {
  description = "Region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  default     = "10.0.0.0/16"
  type        = string
}

variable "eks_cluster_version" {
  description = "EKS version"
  default     = "1.29"
  type        = string
}

variable "eks_key_name" {
  description = "EKS managed nodes key name"
  default     = "0505"
  type        = string
}

variable "grafana_password" {
  description = "EKS managed nodes key name"
  default     = "admin"
  type        = string
}

variable "be_count" {
  description = "EKS managed nodes key name"
  default     = 3
  type        = number
}

variable "fe_count" {
  description = "EKS managed nodes key name"
  default     = 1
  type        = number
}