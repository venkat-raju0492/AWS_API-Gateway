output "base_url" {
  value = aws_api_gateway_deployment.deploy_api.invoke_url
}

output "api_id" {
  value = aws_api_gateway_rest_api.api.id
}