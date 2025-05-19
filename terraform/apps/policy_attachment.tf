resource "aws_iam_role_policy_attachment" "alb_ingress_attach" {
  policy_arn = aws_iam_policy.alb_ingress_policy.arn
  role       = aws_iam_role.alb_ingress.name
}

resource "aws_iam_role_policy_attachment" "eks_admin_attach" {
  role       = aws_iam_role.eks_admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_role_policy_attachment" "eks_read_only_attach" {
  role       = aws_iam_role.eks_read_only.name
  policy_arn = "arn:aws:iam::aws:policy/job-function/ViewOnlyAccess"
}
