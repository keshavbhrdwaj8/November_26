
# Lab 1 – Terraform Landing Zone (Storage, Key Vault, App Service Plan & Web App)

This repository contains a Terraform **root module** that orchestrates 4 **child modules** to deploy:

- **Private Storage Account** (public network disabled)
- **Key Vault** (public network disabled, purge protection enabled)
- **App Service Plan** (Linux)
- **Linux Web App**

An Azure DevOps pipeline (`azure-pipelines.yml`) is provided with **one stage** and **multiple jobs** (init, plan, apply) to deploy these services.

> **Note**: Resource Group (`resource_group_name`) must already exist. We intentionally do **not** create VNet or RG as requested.

---

## Prerequisites

- Azure subscription + permissions to create resources in an existing Resource Group
- Azure DevOps **Service Connection** (Service Principal) with Contributor access
- Azure DevOps project with this repo and pipeline enabled

---

## Structure

```
lab1-landing-zone/
├── provider.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── modules/
│   ├── storage_account/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── key_vault/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── app_service_plan/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── web_app/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
└── azure-pipelines.yml
```

---

## How to Run Locally

1. **Login** via Azure CLI:
   ```bash
   az login
   az account set --subscription "<SUBSCRIPTION-ID>"
   ```
2. **Initialize** and **validate**:
   ```bash
   terraform init
   terraform validate
   ```
3. **Provide variables** (via `-var` or `TF_VAR_`):
   ```bash
   export TF_VAR_resource_group_name="<existing-rg>"
   export TF_VAR_location="centralindia"
   export TF_VAR_storage_account_name="<unique-sa-name>"
   export TF_VAR_key_vault_name="<kv-name>"
   export TF_VAR_app_service_plan_name="<asp-name>"
   export TF_VAR_web_app_name="<web-name>"
   ```
4. **Plan & Apply**:
   ```bash
   terraform plan -out tfplan
   terraform apply -auto-approve tfplan
   ```

---

## Azure DevOps Pipeline

- Update `azureServiceConnection` variable in `azure-pipelines.yml` to your service connection name.
- Create the pipeline from the repo root. It will run **Init → Plan → Apply** in one stage.
- Override TF variables in the pipeline Variables UI as needed.

---

## Notes & Design Choices

- **Storage Account** & **Key Vault** use `public_network_access_enabled = false` and deny public network traffic for private posture without deploying VNet/Private Endpoints.
- **Linux Web App** with **System Assigned Managed Identity** and HTTPS-only for better security.
- **No VNet / RG creation** per your requirement—these must exist already.
- Optional remote state backend is commented in `provider.tf`; uncomment and set actual values if you want shared state.

---

## Cleanup

```bash
terraform destroy -auto-approve
```

---

## Troubleshooting

- Ensure resource names meet Azure constraints (e.g., storage account names must be globally unique and 3–24 lowercase alphanumeric).
- If `azurerm` provider fails to authenticate, ensure Azure CLI is logged in on the agent and locally.
- For pipeline issues, verify that your service connection has **Contributor** role on the subscription/resource group.
