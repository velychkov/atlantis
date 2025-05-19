output "private_subnets_arn" {
  value = module.vpc.private_subnet_arns
}

output "public_subnets_arn" {
  value = module.vpc.public_subnet_arns
}

output "vpc_arn" {
  value = module.vpc.vpc_arn
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnets_ids" {
  value = module.vpc.private_subnets
}

output "public_subnets_ids" {
  value = module.vpc.public_subnets
}