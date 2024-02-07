variable "cluster_name" {
    type = string
    default = "demo-cluster"
    description = "The EKS cluster name"
}

variable "subnet_ids" {
  type = list(string)
  default = ["subnet-**","subnet-*","subnet-*","subnet-*"]
  description = "A list of all subnet IDs to launch the cluster"
}

variable "private_subnet_ids" {
  type        = list(string)
  default     = ["subnet-**","subnet-*"]
  description = "A list of private subnet IDs to launch the fargate profile"
}