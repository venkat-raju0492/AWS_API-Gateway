## HTTP API to expose the internal application load balancer to the internet

HTTP API's doesnt have ip restrictions or WAF layer
It shall be accessible over the internet without any security layer
Only way to secure HTTP apis to add authentication

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

