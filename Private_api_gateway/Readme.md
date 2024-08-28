### AWS api gateway private backend with network internal load balancer

Note: 
1. Private api gateway only supports network internal load balancer (limitation from AWS)
2. Private api gateway doesnt support public application load balancer

To invoke the private api 
format -> https://<api ID>-<vpc endpoint ID>.execute-api.<region>.amazonaws.com/<base path>/api/v1
ex:  https://90tgjdfh-vpce-123456789.execute-api.us-west-2.amazonaws.com/qa/actuator/health

below is the flow when invoked 

vpc endpoint (validate the security group rules and network connectivity) -> API Gateway -> vpc link (attached with network load balancer) -> network load balancer -> target hosts



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


logging enabled with format -> API-Gateway-Execution-Logs_{rest-api-id}/{stage_name} log group name