variable "region" {
    description = "AWS region"
}

variable "project" {
    description = "name of the project"
}

variable "environment" {
    description = "name of the enviornment"
}

variable "cost_category" {
    description = "cost category tag"
}

variable "vpc_endpoint" {
    description = "vpc endpoint"
}

variable "base_path" {
    description = "base path for URL path"
}

variable "lb_target_arn" {
    description = "lb target arn"
}

variable "logging_level" {
    description = "logging level"
    default = "INFO"
}

variable "api_throttling_burst_limit" {
  description = "API throttling burst limit"
  default = "5000"
}

variable "api_throttling_rate_limit" {
  description = "API throttling rate limit."
  default = "10000"
}