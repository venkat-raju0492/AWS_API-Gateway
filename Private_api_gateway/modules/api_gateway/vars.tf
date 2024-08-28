variable "project" {
    description = "name of the project"
}

variable "env" {
    description = "name of the environment"
}

variable "api_swagger_config" {
    description = "api swagger config"
}

variable "vpc_endpoint_id" {
    description = "vpc endpoint id"
}

variable "common_tags" {
    description = "common tags"
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