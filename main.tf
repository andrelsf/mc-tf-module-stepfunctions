#
# Terraform AWS Step Function State Machine resource
#
resource "aws_sfn_state_machine" "state_machine" {
  name       = var.state_machine_name
  role_arn   = var.state_machine_iam_role_arn
  type       = var.state_machine_type
  definition = var.state_machine_definition
  logging_configuration {
    level                  = var.state_machine_log_level
    include_execution_data = var.include_execution_data
    log_destination        = "${aws_cloudwatch_log_group.cw_log_group.arn}:*"
  }
  tracing_configuration {
    enabled = var.tracing_configuration_enabled
  }
  depends_on = [
    aws_cloudwatch_log_group.cw_log_group
  ]
}