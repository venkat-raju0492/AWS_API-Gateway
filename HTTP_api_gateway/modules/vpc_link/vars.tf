variable "vpc_link_name" {
    description = "vpc link name"
}

variable "environment" {
    description  = "environment"
}

variable "project" {
    description = "projct name"
}

variable "common_tags" {
    description = "common tags"
}

variable "security_group_ids" {
    description = "security groupd ids for load balancer"
}
variable "subnet_ids" {
    description = "subnet ids used for load balancer"
}
