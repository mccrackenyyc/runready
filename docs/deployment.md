# RunReady Deployment Guide

## Prerequisites

- Azure CLI installed and authenticated
- Terraform >= 1.12 installed
- Azure subscription with contributor access
- Service principal with appropriate permissions (recommended for CI/CD)

## Initial Setup

### 1. Bootstrap Remote State Storage

The bootstrap configuration creates the storage account for Terraform remote state:

```bash
cd bootstrap/
terraform init
terraform plan
terraform apply
```

After successful bootstrap, note the storage account details from the output.

### 2. Configure Main Infrastructure Backend

The main infrastructure is already configured to use the remote state created by bootstrap. If you need to reconfigure:

```bash
cd infra/
terraform init
```

## Environment Deployment

### Development Environment

```bash
cd infra/
terraform plan -var-file="env-dev.tfvars"
terraform apply -var-file="env-dev.tfvars"
```

### Production Environment

```bash
cd infra/
terraform plan -var-file="env-prd.tfvars"
terraform apply -var-file="env-prd.tfvars"
```

## Environment Teardown

Since this is a portfolio project with cost optimization in mind:

```bash
# Destroy environment resources
cd infra/
terraform destroy -var-file="env-dev.tfvars"

# Optionally destroy bootstrap (removes state storage)
cd ../bootstrap/
terraform destroy
```

## CI/CD Integration

For GitHub Actions integration, set these repository secrets:
- `AZURE_CLIENT_ID`
- `AZURE_CLIENT_SECRET` 
- `AZURE_SUBSCRIPTION_ID`
- `AZURE_TENANT_ID`

## Troubleshooting

### State Lock Issues
If you encounter state lock issues:
```bash
terraform force-unlock <LOCK_ID>
```

### Backend Reconfiguration
If storage account details change:
```bash
terraform init -reconfigure
```