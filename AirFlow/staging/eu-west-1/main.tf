locals {
  name-prefix = {
    environment = var.environment
    # company     = var.company
    project     = var.project
  }
  prefix = "${var.project}-${var.environment}"
}


# VPC
# -----------------
module "vpc" {
  source     = "../../../modules/vpc"
  for_each   = var.vpc
  name       = "${each.key}-${local.prefix}"
  cidr_block = each.value.cidr_block
}


# Subnet
# -----------------
module "subnet" {
  source                  = "../../../modules/subnet"
  for_each                = var.subnet
  name                    = "${each.key}-${local.prefix}"
  vpc_id                  = module.vpc["vpc"].id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = lookup(each.value, "map_public_ip_on_launch", null)
}


# Internet Gateway
# -----------------
module "internet_gateway" {
  source   = "../../../modules/aws-internet-gateway"
  for_each = var.internet_gateway
  name     = "${each.key}-${local.prefix}"
  vpc_id   = module.vpc["vpc"].id
}


# # Elastic IP
# # -----------------
module "elastic_ip" {
  source   = "../../../modules/aws-eip"
  for_each = var.elastic_ip
  name     = "${each.key}-${local.prefix}"
}


# NAT Gateway
# -----------------
module "nat_gateway" {
  source        = "../../../modules/aws-nat-gateway"
  for_each      = var.nat_gateway
  name          = "${each.key}-${local.prefix}"
  subnet_id     = module.subnet["public-subnet-1a"].id
  allocation_id = module.elastic_ip["eip-natgw"].id
  depends_on    = [module.internet_gateway]
}


# Security Group
# -----------------
module "security_group1" {
  source          = "../../../modules/security-group"
  for_each        = var.security_group1
  name            = "sg1-${local.prefix}"
  vpc_id          = module.vpc["vpc"].id
  egress          = lookup(each.value, "egress", null)
  ingress         = lookup(each.value, "ingress", null)
  # security_groups = [module.security_group2["security-group2"].id]
}

module "security_group2" {
  source          = "../../../modules/security-group"
  for_each        = var.security_group2
  name            = "sg2-${local.prefix}"
  vpc_id          = module.vpc["vpc"].id
  egress          = lookup(each.value, "egress", null)
  ingress         = lookup(each.value, "ingress", null)
  # security_groups = [module.security_group1["security-group1"].id]
}
# resource "aws_key_pair" "key-pair" {
#   key_name   = "cPanel-key"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDO31kDZ00k9zMyeBrBMYEIsNl7qOZVXXnIePAfHYEkT3L7vozBW05ATYNxZ84SgKAPc80aoEiBqP3FNXJlGUBNr05kds2GRgH5f4bdM/UVjQwfM4TK7dh84PoIosTzexRoLGQdovOz2a3D4tquDUajBpfj2G4TD1IS8ETDTFAwNHTDKRQSQxpKPnYEexpxA4JzOQ5HRmSO1o79UI7G0OhcZfSaHuMSZ8wNjuyXe+ycbOFrfc37NKrK8i5m8kZxd0mdYs6ZrO3LvuIabaw/cjaougvZoGfX8hkurkmBcp45wQIZ8vDDBL+CRLv7ynYsvns974UHzJrAWnmmKy1jeMxN rsa-key-20231224"
# }

resource "aws_security_group_rule" "sg1_to_sg2" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  source_security_group_id = module.security_group2["security-group2"].id
  security_group_id = module.security_group1["security-group1"].id
}

resource "aws_security_group_rule" "sg2_to_sg1" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  source_security_group_id = module.security_group1["security-group1"].id
  security_group_id = module.security_group2["security-group2"].id
}

# #  Route Table
# # ----------------
## Public:
module "public_route_table" {
  source   = "../../../modules/route-table"
  for_each = var.public_route_table
  name     = each.key
  vpc_id   = module.vpc["vpc"].id
}

## Private:
module "private1_route_table" {
  source   = "../../../modules/route-table"
  for_each = var.private1_route_table
  name     = each.key
  vpc_id   = module.vpc["vpc"].id
}

module "private2_route_table" {
  source   = "../../../modules/route-table"
  for_each = var.private2_route_table
  name     = each.key
  vpc_id   = module.vpc["vpc"].id
}

# #  Route
# # -------
## Public:
module "public_route" {
  source                 = "../../../modules/route"
  for_each               = var.public_route
  route_table_id         = module.public_route_table["public-route-table"].id
  destination_cidr_block = lookup(each.value, "destination_cidr_block", null)
  gateway_id             = module.internet_gateway["ig"].id
}

## Private:
module "private_route1" {
  source                 = "../../../modules/route"
  for_each               = var.private_route1
  route_table_id         = module.private1_route_table["private1-route-table"].id
  destination_cidr_block = lookup(each.value, "destination_cidr_block", null)
  nat_gateway_id         = module.nat_gateway["natgw"].id
}

module "private_route2" {
  source                 = "../../../modules/route"
  for_each               = var.private_route2
  route_table_id         = module.private2_route_table["private2-route-table"].id
  destination_cidr_block = lookup(each.value, "destination_cidr_block", null)
  nat_gateway_id         = module.nat_gateway["natgw"].id
}

# module "private1_route_s3_endpoint" {
#   source                 = "../../../modules/route"
#   for_each               = var.private1_route_s3_endpoint
#   route_table_id         = module.private1_route_table["private1-route-table"].id
#   destination_cidr_block = lookup(each.value, "destination_cidr_block", null)
#   vpc_endpoint_id        = module.vpc_endpoint["vpc-endpoint"].id
#   depends_on             = [module.vpc_endpoint]
# }

# module "private2_route_s3_endpoint" {
#   source                 = "../../../modules/route"
#   for_each               = var.private2_route_s3_endpoint
#   route_table_id         = module.private2_route_table["private2-route-table"].id
#   destination_cidr_block = lookup(each.value, "destination_cidr_block", null)
#   vpc_endpoint_id        = module.vpc_endpoint["vpc-endpoint"].id
#   depends_on             = [module.vpc_endpoint]
# }


# #  Association Route Table
# # -------------------------
## Public:
module "public1_association_route_table" {
  source         = "../../../modules/route-table-association"
  subnet_id      = module.subnet["public-subnet-1a"].id
  route_table_id = module.public_route_table["public-route-table"].id
}
module "public2_association_route_table" {
  source         = "../../../modules/route-table-association"
  subnet_id      = module.subnet["public-subnet-1b"].id
  route_table_id = module.public_route_table["public-route-table"].id
}

## Private:
module "private1_association_route_table" {
  source         = "../../../modules/route-table-association"
  subnet_id      = module.subnet["private-subnet-1a"].id
  route_table_id = module.private1_route_table["private1-route-table"].id
}
module "private2_association_route_table" {
  source         = "../../../modules/route-table-association"
  subnet_id      = module.subnet["private-subnet-1b"].id
  route_table_id = module.private2_route_table["private2-route-table"].id
}


# S3 Bucket
# -----------------
module "s3" {
  source   = "../../../modules/s3-bucket"
  for_each = var.s3
  name     = "${each.key}-${local.prefix}"
}

resource "aws_s3_bucket_object" "add_folder" {
  bucket = module.s3["s3"].id
  key    = "dags/"
}

resource "aws_s3_bucket_object" "upload_requirements" {
  bucket = module.s3["s3"].id
  key    = "requirements.txt"
}

# VPC Endpoint
# -----------------
module "vpc_endpoint" {
  source              = "../../../modules/vpc-endpoint"
  for_each            = var.vpc_endpoint
  service_name        = lookup(each.value, "service_name", null)
  vpc_endpoint_type   = lookup(each.value, "vpc_endpoint_type", null)
  private_dns_enabled = lookup(each.value, "private_dns_enabled", null)
  vpc_id              = module.vpc["vpc"].id
  route_table_ids     = [module.private1_route_table["private1-route-table"].id, module.private2_route_table["private2-route-table"].id]
}

# VPC Endpoint Route Table Association
# -------------------------------------
# module "vpc_endpoint_route_table_association" {
#   source   = "../../../modules/vpc-endpoint-route-table-association"
#   route_table_id  = module.private_route_table["private-route-table"].id
#   vpc_endpoint_id = module.vpc_endpoint["vpc-endpoint"].id
# }


# MWAA Environment
# -----------------
data "aws_iam_role" "mwaa_iam_role" {
  name = "mwaa-env-role"
}

module "mwaa-environment" { 
  source   = "../../../modules/mwaa-environment"
  for_each = var.mwaa_environment
  name     = "${each.key}-${local.prefix}"
  dag_s3_path = lookup(each.value, "dag_s3_path", null)
  environment_class = lookup(each.value, "environment_class", null)
  webserver_access_mode = lookup(each.value, "webserver_access_mode", null)
  requirements_s3_path = lookup(each.value, "requirements_s3_path", null)
  execution_role_arn = data.aws_iam_role.mwaa_iam_role.arn
  network_configuration = [{
    security_group_ids = [module.security_group2["security-group2"].id]
    subnet_ids         = [module.subnet["private-subnet-1a"].id, module.subnet["private-subnet-1b"].id]
  }]
  source_bucket_arn = module.s3["s3"].arn
  depends_on = [aws_security_group_rule.sg1_to_sg2, aws_security_group_rule.sg2_to_sg1]
}