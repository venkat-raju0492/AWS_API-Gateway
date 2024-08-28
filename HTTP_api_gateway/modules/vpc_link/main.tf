#VPC link
resource "aws_apigatewayv2_vpc_link" "vpc_link" {
  name                 = var.vpc_link_name
  security_group_ids   = var.security_group_ids
  subnet_ids           = var.subnet_ids

  tags = merge(var.common_tags, map(
    "Name",  "${var.project}-vpclink-${var.environment}"
  ))
}