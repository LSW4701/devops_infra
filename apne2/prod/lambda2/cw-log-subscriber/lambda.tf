module "lambda" {
  source       = "../../../../modules/lambda"
  name         = local.name
  handler      = var.handler
  source_path  = "dist.zip"
  runtime      = var.runtime
  timeout      = var.timeout
  environments = local.envs
  role_arn     = aws_iam_role.this.arn

  tags         = merge(local.tags, { Name = format("%s-lambda", var.name) })
}

resource "aws_lambda_permission" "this" {
  statement_id  = "AllowExecutionFromCloudWatch"  # 클라우드로부터 실행된다
  principal     = "logs.${var.region}.amazonaws.com" # 누가?  해당 리전의 log(클라우드 와치가) 
  action        = "lambda:InvokeFunction"  # 람다 트리거 
  function_name = module.lambda.function_name  # 해당 람다를 실행 
  source_arn    = "arn:aws:events:${var.region}:${data.aws_caller_identity.current.account_id}:log-group:${var.log_group_name}:*"
}