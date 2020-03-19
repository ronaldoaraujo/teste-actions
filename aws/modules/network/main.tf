######
# VPC
######
resource "aws_vpc" "this" {
  cidr_block           = var.cidr
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_classiclink   = var.enable_classiclink
  instance_tenancy     = var.instance_tenancy

  tags = {
    Name = var.name
  }
}

################
# Public subnet
################
resource "aws_subnet" "public" {
  count = length(var.public_subnets)

  vpc_id                  = aws_vpc.this.id
  cidr_block              = element(var.public_subnets, count.index)
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availability_zone       = element(var.azs, count.index)
  tags = {
    "Name" = format(
      "%s-${var.public_subnet_suffix}-%s",
      var.name,
      element(var.azs, count.index),
    )
  }
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

################
# Private subnet
################
resource "aws_subnet" "private" {
  count = length(var.private_subnets)

  vpc_id                  = aws_vpc.this.id
  cidr_block              = element(var.private_subnets, count.index)
  availability_zone       = element(var.azs, count.index)
  tags = {
    "Name" = format(
      "%s-${var.private_subnet_suffix}-%s",
      var.name,
      element(var.azs, count.index),
    )
  }
  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}
