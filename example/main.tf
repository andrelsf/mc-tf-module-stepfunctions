module "state_machine" {
  source                     = "git::https://github.com/andrelsf/mc-tf-module-stepfunctions.git?ref=1.0.0"
  state_machine_name         = "asl-definition/state_machine.json"
  state_machine_type         = "EXPRESS"
  state_machine_iam_role_arn = "arn:aws:iam::111122223333:role/service-role/SateMachineExecutionRole"
  state_machine_log_level    = "ERROR"
  state_machine_definition   = templatefile("als-definition/state_machine.json", {})
}