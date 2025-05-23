region = "eu-west-1"

name = "my-vpc"
cidr = "10.0.0.0/16"

azs             = ["eu-west-1a", "eu-west-1b"]
# private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = []
public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

enable_nat_gateway = false
enable_vpn_gateway = false

tags = {
  Terraform = "true"
  Environment = "dev"
}