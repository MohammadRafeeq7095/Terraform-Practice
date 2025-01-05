# Run first terraform-10-30am/day-4-resources_for_backend_s3_dynamodb to create reources 
# This backend configuration instructs Terraform to store its state in an S3 bucket.
 terraform {
backend "s3" {
    bucket         = "state-lock-bucket"  # Name of the S3 bucket where the state will be stored.
    region         =  "us-east-1"
    key            = "terraform.tfstate" # Path within the bucket where the state will be read/written.
    dynamodb_table = "terraform-state-lock-dynamodb" # DynamoDB table used for state locking, note: first run day-4-bckend resources then day-5-backend config
    encrypt        = true  # Ensures the state is encrypted at rest in S3.
}
}