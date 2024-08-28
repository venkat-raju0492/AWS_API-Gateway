terraform {
  backend "s3" {}
}

provider "aws" {
  region = var.region
}

locals {
  #common tags
  common_tags = {
    Project                     = var.project
    Environment                 = var.environment
    CreatedBy                   = "Terraform"
    CostCategory                = var.cost_category
  }
}

data "template_file" "api_swagger_config" {
  template = file("./templates/apigateway/api.json")

  vars = {
    project                     = var.project
    env                         = var.environment
    domain_name                 = avr.apigateway_domain_name
    cost_category               = var.cost_category
    vpc_link_id                 = module.vpc_link.vpc_link_id
    alb_listener                = var.alb_listener_arn
    api_path_mapping            = var.api_path_mapping
    stage_name                  = var.stage_name
  }
}

module "vpc_link" {
  source                       = "./modules/vpc_link"
  vpc_link_name                = "${var.project}-vpc-link-${var.environment}"
  security_group_ids           = var.security_group_ids
  subnet_ids                   = var.subnet_ids
  project                      = var.project
  environment                  = var.environment
  common_tags                  = local.common_tags
}

module "API"{
  source                          = "./modules/api_gateway"
  api_name                        = "${project}-apigateway-${env}"
  protocol_type                   = var.protocol_type
  rendered_api_swagger_config     = data.template_file.api_swagger_template_store_service.rendered
  integration_uri                 = var.alb_listener_arn
  vpc_link_id                     = module.vpc_link.vpc_link_id
  stage_name                      = var.stage_name
  auto_deploy                     = var.api_auto_deploy
  apigateway_domain_name          = var.apigateway_domain_name
  api_path_mapping                = var.api_path_mapping
}