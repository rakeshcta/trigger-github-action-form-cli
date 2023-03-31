resource "aws_lambda_function" "example" {
  filename = "function.zip"
  function_name = "lambda-testing"
  role = aws_iam_role.example.arn
  handler = "index.handler"
  runtime = "nodejs12.x"
  vpc_config  {
    subnet_ids = ["subnet-021d1fa4447a9db53"]
    security_group_ids = ["sg-0e4caefceb3831a77"]
  }
  timeout = 30

  reserved_concurrent_executions = 10
}

resource "aws_iam_role" "example" {
  name = "example-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}
