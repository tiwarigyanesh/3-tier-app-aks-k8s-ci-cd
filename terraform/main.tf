terraform {
  backend "s3" {
    bucket         = "ironhack-project-bucket5"
    key            = "states/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "lock-table"
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
}

module "subnets" {
  source  = "./modules/subnets"
  vpc_id  = module.vpc.vpc_id
  subnets = var.subnets
}

module "gateway" {
  source       = "./modules/gateway"
  vpc_id       = module.vpc.vpc_id
  gateway_name = var.gateway_name
}

module "security_group" {
  source                       = "./modules/security_group"
  subnet_cidr_blocks           = module.subnets.subnet_cidr_block
  vpc_id                       = module.vpc.vpc_id
  ingress_rules                = var.ingress_rules
  egress_rules                 = var.egress_rules
  frontend_security_group_name = "frontend_security_group"
  backend_security_group_name  = "backend_security_group"
  database_security_group_name = "database_security_group"
}

module "ec2_instances" {
  source        = "./modules/ec2"
  vpc_id        = module.vpc.vpc_id
  subnet_ids    = module.subnets.subnet_ids
  ec2_instances = var.ec2_instances
  security_group_id = {
    frontend = module.security_group.frontend_security_group_id
    backend  = module.security_group.backend_security_group_id
    database = module.security_group.database_security_group_id
  }
}

module "route_tables" {
  source                 = "./modules/route_tables"
  route_table_name       = "room2-project1-route_table"
  vpc_id                 = module.vpc.vpc_id
  gateway_id             = module.gateway.gateway_id
  destination_cidr_block = var.destination_cidr_block
  subnet_ids             = module.subnets.subnet_ids
}
