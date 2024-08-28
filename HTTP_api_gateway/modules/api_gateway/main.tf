#HTTP API
resource "aws_apigatewayv2_api" "http_api" {
  name                   = var.api_name
  protocol_type          = var.protocol_type
  body                   = var.rendered_api_swagger_config
  cors_configuration {
    allow_origins = ["*"]
    allow_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST" ,"PUT"]
    allow_headers = ["*"]
  }
  tags = merge(var.common_tags, map(
    "Name",  "${var.api_name}"
  ))
}

#HTTP API Integration
resource "aws_apigatewayv2_integration" "api_integration" {
  api_id                 = aws_apigatewayv2_api.http_api.id
  description            = "Private ALB integration with API via VPC link"
  integration_type       = "HTTP_PROXY"
  integration_uri        = var.integration_uri
  integration_method     = "ANY"
  connection_type        = "VPC_LINK"
  connection_id          = var.vpc_link_id
}

#HTTP API stage creation
resource "aws_apigatewayv2_stage" "stage" {
  api_id               = aws_apigatewayv2_api.http_api.id
  name                 = var.stage_name
  auto_deploy          = var.auto_deploy

  tags = merge(var.common_tags, map(
    "Name",  "${var.project}-stage-${var.environment}"
  ))
}

#domain path mapping
resource "aws_apigatewayv2_api_mapping" "api_path_mapping" {
  api_id      = aws_apigatewayv2_api.http_api.id
  stage       = aws_apigatewayv2_stage.stage.id
  domain_name = var.apigateway_domain_name
  api_mapping_key   = var.api_path_mapping
}

