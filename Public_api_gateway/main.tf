terraform {
  backend "s3" {}
}

provider "aws" {
  region = var.region
}
provider "aws" {
  region  = "us-east-1"
  version = "3.71.0"
}

local {
}

data "template_file" "api_swagger_config" {
  template = file("./templates/apigateway/api.json")

  vars = {
    apigateway_domain_name      = var.apigateway_domain_name
    project                     = var.project
    env                         = var.env
    mapping_path                = var.apigateway_domain_application_mapping_path
    application_api_url         = var.application_api_url
    region                      = var.region
    account_id                  = local.account_id
    access_control_allow_origin = var.access_control_allow_origin
  }
}

module "APIGateway" {
  source                                     = "../modules/api_gateway/"
  project                                    = var.project
  env                                        = var.env
  apigateway_domain_name                     = var.apigateway_domain_name
  apigateway_domain_application_mapping_path = var.apigateway_domain_application_mapping_path
  rendered_api_swagger_config                = data.template_file.api_swagger_config.rendered
  common_tags                                = local.common_tags
  logging_level                              = var.api_logging_level
  api_throttling_burst_limit                 = var.api_throttling_burst_limit
  use_api_allowed_ips                        = var.use_api_allowed_ips
  api_throttling_rate_limit                  = var.api_throttling_rate_limit
  endpoint_type                              = var.endpoint_configuration_type
}

resource "aws_api_gateway_usage_plan" "usageplan" {
  name         = "${var.project}-${var.env}-usage-plan"
  product_code = "RANDOM"

  api_stages {
    api_id = module.APIGateway.api_id
    stage  = var.env
  }
}