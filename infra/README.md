# RunReady Infrastructure

Terraform configuration for RunReady Azure infrastructure using trunk-based development and DRY principles.

## Modules

Reusable Terraform modules are sourced from the separate `terraform-modules` repository to maintain DRY principles and enable cross-project reuse.

## Usage

### Validation and Formatting
```bash
terraform validate
terraform fmt
```

### Planning and Applying
```bash
# Development
terraform plan -var-file="env-dev.tfvars"
terraform apply -var-file="env-dev.tfvars"

# Production  
terraform plan -var-file="env-prd.tfvars"
terraform apply -var-file="env-prd.tfvars"
```

## Environment Configuration

Environments are managed via tfvars files:
- `env-dev.tfvars`: Development environment settings
- `env-prd.tfvars`: Production environment settings

## Naming Conventions

Resources follow the pattern: `{workload}-{environment}-{resource_type}-{purpose}[-{random_string}]`

Random string (3 characters) is added only when Azure requires global uniqueness to minimize collision risk.

Examples:
- Resource Group: `rr-dev-rg-core`
- Storage Account: `rrdevstcoretl8` (random string for global uniqueness)

## Tagging Strategy

All resources are tagged with:
- `workload`: Full workload name
- `environment`: Environment identifier
- `managed_by`: "terraform"

## Remote State

This configuration uses Azure Storage backend for state management. State storage is created by the bootstrap configuration in `../bootstrap/`.