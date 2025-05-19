resource "aws_iam_policy" "alb_ingress_policy" {
  name   = "AWSLoadBalancerControllerIAMPolicy"
  policy = file("${path.module}/iam-policy.json")
}