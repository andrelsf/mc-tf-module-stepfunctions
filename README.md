# Terraform Module AWS Step Functions

## Using the module

### Requirements
- Creation of the IAM Role with the appropriate permissions to run the state machine
- Creatian of the Cloudwatch log groups permissions.

### Using

1. Simple example of using the module

```hcl
module "state_machine" {
  source                     = "git::https://github.com/andrelsf/mc-tf-module-stepfunctions.git?ref=1.0.0"
  state_machine_name         = "hello-world-state-machine-workflow"
  state_machine_type         = "EXPRESS"
  state_machine_iam_role_arn = "arn:aws:iam::111122223333:role/service-role/SateMachineExecutionRole"
  state_machine_log_level    = "ERROR"
  state_machine_definition   = templatefile("als-definition/state_machine.json", {})
}
```

2. Add the AWS provider

Example:

```hcl
provider "aws" {
  region                   = "us-east-1"
  profile                  = "default"
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
}
```

# Referencies

- [Terraform AWS Step Funtion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sfn_state_machine)