## API Gateway setup with terraform 

Public api gateway with custom domain path mapping
Public api gateway gets to integrate with WAF as well as can restrict the Ips to allow access in resource policy
API Gateway integration with Load balancer endpoint with cname mapping
CORS enabled
burst limit, rate limit also configured

Default values for understanding in tfvars


API Gateway Usage plan creation for x-api-key authentication ex curl:  "curl --location 'https://dev-api.com/actuator/health' --header 'x-api-key: <token>' "


To apply terraform script

terraform init -backend-config="bucket=<s3 bucket name>" \                                      // initialize terraform with S3 backend
            -backend-config="key=<s3 path>" \
            -backend-config="region=<s3 bucket region>" \
            -backend=true \
            -force-copy \
            -get=true \
            -input=false \
            -upgrade \
            -no-color'

terraform plan -var-file=dev.tfvars  -out dev-plan -no-color                            // plan sending output to plan file

terraform apply --input=false dev-plan -no-color                                        // apply the same plan output file


terraform destroy -var-file=dev.tfavs -auto-approve -no-color                          // destroy the infra



## Loggin enable for API Gateway

create IAM role with below policy

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:DescribeLogGroups",
                "logs:DescribeLogStreams",
                "logs:PutLogEvents",
                "logs:GetLogEvents",
                "logs:FilterLogEvents"
            ],
            "Resource": "*"
        }
    ]
}


In API Gateway console for CloudWatch log role ARN, enter an ARN of an IAM role with above permissions. You need to do this once for each AWS account that creates APIs using API Gateway.

For CloudWatch log role ARN, enter an ARN of an IAM role with appropriate permissions. You need to do 
this once for each AWS account that creates APIs using API Gateway.

In the main navigation pane, choose APIs, and then do one of the following:
Choose an existing API, and then choose a stage.
Create an API, and then deploy it to a stage.

In the main navigation pane, choose Stages.
In the Logs and tracing section, choose Edit.
To enable execution logging:
Select a logging level from the CloudWatch Logs dropdown menu. The logging levels are the following:
Off – Logging is not turned on for this stage.
Errors only – Logging is enabled for errors only.
Errors and info logs – Logging is enabled for all events.
Full request and response logs – Detailed logging is enabled for all events. This can be useful to troubleshoot APIs, but can result in logging sensitive data.

logging enabled with format -> API-Gateway-Execution-Logs_{rest-api-id}/{stage_name} log group name

