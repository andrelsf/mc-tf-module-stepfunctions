resource "aws_cloudwatch_log_group" "cw_log_group" {
  name              = "/aws/logs/statemachines/${var.state_machine_name}"
  retention_in_days = var.cw_retention_in_days
}