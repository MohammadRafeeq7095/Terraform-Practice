module "lambda_function_externally_managed_package" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "my-lambda-externally-managed-package"
  description   = "My lambda function code is deployed separately"
  handler       = "lambda-function.lambda_handler"
  runtime       = "python3.12"

  create_package         = false
  local_existing_package = "lambda_function.zip"

  ignore_source_code_hash = true
}