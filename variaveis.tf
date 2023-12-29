#
# Terraform Variables
#
variable "state_machine_name" {
  description = "The State machine name"
  type        = string
  validation {
    condition     = can(regex("^[A-Za-z0-9_-]+$", var.state_machine_name))
    error_message = "The state machine name must only contain the characters 'A-Z', 'a-z', '0-9', '_' or '-'"
  }
}

variable "state_machine_iam_role_arn" {
  description = "(Required) The Amazon Resource Name (ARN) of the IAM role to use for this state machine."
  type        = string
  nullable    = false
  validation {
    condition = can(regex("arn:aws:(iam)::[0-9]+:(role)/\\w", var.state_machine_iam_role_arn))
    error_message = "IAM Role invalid format"
  }
}

variable "state_machine_definition" {
  description = "(Required) The Amazon States Language definition of the state machine."
  type        = string
  nullable    = false
}

variable "state_machine_type" {
  description = "(Optional) Determines whether a Standard or Express state machine is created. You cannot update the type of a state machine once it has been created."
  type        = string
  default     = "STANDARD"
  validation {
    condition     = contains(["EXPRESS", "STANDARD"], var.state_machine_type)
    error_message = format("Unsupported type '%s'. State machine types are 'EXPRESS' or 'STANDARD'", var.state_machine_type)
  }
}

variable "publish" {
  description = "(Optional) Set to true to publish a version of the state machine during creation."
  type        = bool
  default     = false
}

variable "include_execution_data" {
  description = "Include execution data"
  type        = bool
  default     = true
}

variable "state_machine_log_level" {
  description = "State machine Cloudwatch log level."
  type        = string
  default     = "ERROR"
  validation {
    condition     = contains(["ALL", "ERROR", "FATAL", "OFF"], var.state_machine_log_level)
    error_message = "Unsupported type '%s'. Log levels are ALL, ERROR, FATAL or OFF."
  }
}

variable "tracing_configuration_enabled" {
  description = "(Optional) When set to true, AWS X-Ray tracing is enabled. Make sure the State Machine has the correct IAM policies for logging."
  type        = bool
  default     = false
}

variable "cw_retention_in_days" {
  description = "(Optional) Specifies the number of days you want to retain log events in the specified log group."
  type        = number
  default     = 7
}