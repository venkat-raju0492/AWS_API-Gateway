variable "region" {
    description = "AWS region"
}

variable "project" {
    description = "name of the project"
}

variable "environment" {
    description = "name of the environment"
}

variable "cost_category" {
    description = "cost category"
}

variable "apigateway_domain_name" {
    description = "apigateway domain name"
}

variable "alb_listener_arn" {
    description = "alb listener arn"
}

variable "stage_name" {
    description = "stage name"
}

variable "api_path_mapping" {
    description = "api path mapping"
}

variable "security_group_ids" {
    description = "lb security group"
}

variable "subnet_ids" {
    description= "subnet ids"
}

variable "protocol_type" {
    description = "protocol type"
}

variable "api_auto_deploy" {
    description = "api auto deploy"
}
