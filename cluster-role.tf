data  "aws_iam_policy_document" "assume_role" {
    statement {
      effect = "Allow"
      principals {
        type = "Service"
        identifiers = ["eks.amazonaws.com"]
      }
      actions = [ "sts:AssumeRole" ]
    }
}

resource "aws_iam_role" "cluster_role" {
    name = "cluster-role"
    assume_role_policy = data.aws_iam_policy_document.assume_role.json
    path = "/"
}

resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role = aws_iam_role.cluster_role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role = aws_iam_role.cluster_role.name
}