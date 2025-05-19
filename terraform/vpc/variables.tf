variable "region" {
  type    = string
}

variable "name" {
  type    = string
}

variable "cidr" {
  type    = string
}

variable "azs" {
  type    = list(string)
}

variable "private_subnets" {
  type    = list(string)
}

variable "public_subnets" {
  type    = list(string)
}

variable "enable_nat_gateway" {
  type    = bool
}

variable "enable_vpn_gateway" {
  type    = bool
}

variable "tags" {
  type    = map(string)
}