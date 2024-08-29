region                            = "us-west-2"                                     ## AWS region to deploy service
project                           = "poc"                                           ## name of the project
environment                       = "dev"                                           ## name of the environment
cost_category                     = "poc"                                           ## cost category tag

apigateway_domain_name            = "dev-api.com"                                   ## custom domain name
alb_listener_arn                  = "HTTP target group arn"                         ## internal load balancer target group ARN
stage_name                        = "dev"                                           ## name of the stage
api_path_mapping                  = "poc"                                           ## custom domain path mapping ex: https://dev-api.com/<path>
security_group_ids                = ["sg-xxxxxxxx"]                                 ## load balancer security group
subnet_ids                        = ["subnet-xxxx","subnet-xxxx", "subnet-xxxxx"]   ## subnet group ids
protocol_type                     = "HTTP"                                          ## api gateway tryp ex: PRIVATE REGIONAL HTTP
api_auto_deploy                   = true                                            ## to deploy api automatically
