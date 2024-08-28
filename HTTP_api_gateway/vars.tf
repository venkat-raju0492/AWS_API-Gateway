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

variable "alb_listener_arn" {
    description = "alb listener arn"
}

variable "security_group_ids" {
    description = "lb security group"
}

variable "subnet_ids" {
    description= "subnet ids"
}

variable "stage_name" {
    
}