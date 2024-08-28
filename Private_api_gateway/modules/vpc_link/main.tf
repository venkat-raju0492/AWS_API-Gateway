resource "aws_api_gateway_vpc_link" "vpc_link" {
  name                 = "${var.project}-vpc-link-${var.env}"
  target_arns          = [var.lb_target_arn]

  tags = merge(var.common_tags, map(
    "Name",  "${var.project}-vpc-link-${var.env}"
  ))
}