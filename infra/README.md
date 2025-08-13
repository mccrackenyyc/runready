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

## Network Architecture

### Virtual Network Design
- **Address Space**: Environment-specific CIDR blocks (10.100.0.0/16 for dev, 10.200.0.0/16 for prod)
- **Subnet Strategy**: Purpose-based subnet segmentation

### Subnet Configuration
| Subnet | Purpose | Address Range | Service Endpoints |
|--------|---------|---------------|-------------------|
| `app` | Application services, container workloads | /24 | None |
| `data` | Database and storage resources | /24 | Microsoft.Storage, Microsoft.Sql |

### Design Decisions
- **Canadian Data Residency**: All resources constrained to Canadian regions
- **Environment Isolation**: Separate address spaces prevent cross-environment routing
- **Service Endpoints**: Enabled on data subnet for secure Azure PaaS connectivity
- **Private Endpoint Ready**: All subnets configured for private endpoint deployment