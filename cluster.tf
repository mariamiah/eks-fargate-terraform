resource "aws_cloudwatch_log_group" "cluster_log" {
    name = "/aws/eks/${var.cluster_name}/cluster"
    retention_in_days = 90
}

resource "aws_eks_cluster" "eks" {
    enabled_cluster_log_types = ["api", "audit"]
    name = var.cluster_name
    role_arn = aws_iam_role.cluster_role.arn
    version = "1.27"
    vpc_config {
      endpoint_private_access = false
      endpoint_public_access = true
      public_access_cidrs = [
        "0.0.0.0/0",
      ]
      subnet_ids = var.subnet_ids
    }
    depends_on = [ 
        aws_iam_role.cluster_role
     ]
}