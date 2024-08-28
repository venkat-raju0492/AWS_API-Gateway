variable "region" {
    description = "AWS region"
}

variable "apigateway_domain_name" {
    description = "apigateway custom domain name"
}

variable "project" {
    description = "name of the project"
}

variable "env" {
    description = "name of the environment"
}

variable "apigateway_domain_application_mapping_path" {
    description = "apigateway domain application mapping path"
}

variable "application_api_url" {
    description = "backend application api url"
}

varianle "access_control_allow_origin" {
    description ="access control allow origin for cors mechanism"
}

variable "api_logging_level" {
    description = "api logging level"
}

variable "api_throttling_burst_limit" {
    description = "api throttling burst limit"
}

variable "use_api_allowed_ips" {
    description = "use api allowed ips"
}

variable "api_throttling_rate_limit" {
    description = "api throttling rate limit"
}

variable "endpoint_configuration_type" {
    description = "endpoint configuration type"
}