terraform {
    backend "s3" {}
}

provider "aws" {
    region = var.region
}

data "aws_caller_identity" "current" {}

locals {
  lb_endpoint                    = "dev-api.com"
  account_id                     = data.aws_caller_identity.current.account_id
  common_tags = {
    Project                     = var.project
    Environment                 = var.environment
    CreatedBy                   = "Terraform"
    CostCategory                = var.cost_category
  }
}

data "template_file" "api_swagger_template_order_service_v1" {
  template = file("templates/api.json")
  vars = {
    project                                           = var.project
    env                                               = var.environment
    vpc_connection_id                                 = module.vpc_link.vpc_link_id
    lb_endpoint                                       = local.lb_endpoint
    vpc_endpoint                                      = var.vpc_endpoint
    base_path                                         = var.base_path
  }
}

module "vpc_link" {
  source                        = "./modules/vpc_link"
  project                       = var.project
  env                           = var.environment
  common_tags                   = local.common_tags
  lb_target_arn                 = var.lb_target_arn
}

module "API-Gateway" {
  source                       = "./modules/api_gateway"
  project                      = var.project
  env                          = var.environment
  api_swagger_config           = data.template_file.api_swagger_template_order_service_v1.rendered
  vpc_endpoint_id              = var.vpc_endpoint
  common_tags                  = local.common_tags
  logging_level                = var.logging_level
  api_throttling_burst_limit   = var.api_throttling_burst_limit
  api_throttling_rate_limit    = var.api_throttling_rate_limit
}
