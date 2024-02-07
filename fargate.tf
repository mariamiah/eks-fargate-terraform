resource "aws_eks_fargate_profile" "fargate" {
    cluster_name = aws_eks_cluster.eks.name
    fargate_profile_name = "fargate-workload"
    pod_execution_role_arn = aws_iam_role.fargate_role.arn
    subnet_ids = var.private_subnet_ids
    selector {
        namespace = "fargate-workload"
    }
}