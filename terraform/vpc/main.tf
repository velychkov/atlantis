module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.name
  cidr = var.cidr

  azs                     = var.azs
  private_subnets         = var.private_subnets
  public_subnets          = var.public_subnets
  map_public_ip_on_launch = true


  enable_nat_gateway = var.enable_nat_gateway
  enable_vpn_gateway = var.enable_nat_gateway

  tags = var.tags
}