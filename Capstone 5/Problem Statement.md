Problem Statement
You are tasked with migrating the local Terraform state file to HCP Terraform for improved security, collaboration, and state management. The migration should be seamless, without disrupting existing infrastructure or services. Post-migration, the Terraform workflow should utilize the HCP Terraform backend for state management.

Requirements
Inputs
organization_name (type: string) - Name of the HCP Terraform organization.
workspace_name (type: string, default: "default-workspace") - Name of the workspace in HCP Terraform for storing the state.
state_file_path (type: string, default: "./terraform.tfstate") - Path to the local Terraform state file to migrate.
Resources
HCP Terraform Workspace:
Create or use an existing workspace within the specified organization.
Ensure the workspace is empty (contains no existing state) before migration.
HCP Terraform Integration:
Authenticate the Terraform CLI with HCP Terraform.
Configure the cloud block in the Terraform configuration for backend integration.
Local Terraform State File:
Migrate the existing local state file to the configured HCP Terraform workspace.
Steps
Prepare Local Configuration

Clone the configuration repository:
git clone https://github.com/hashicorp/learn-state-migration
cd learn-state-migration
Initialize and apply the Terraform configuration to generate a local state file:
terraform init  
terraform apply -auto-approve  
Configure HCP Terraform Integration

Update main.tf with the cloud block:
terraform {
  cloud {
    organization = "<organization_name>"
    workspaces {
      name = "<workspace_name>"
    }
  }
}
Authenticate the Terraform CLI:
terraform login  
Migrate State to HCP Terraform

Reinitialize Terraform to detect the backend changes:
terraform init  
Confirm state migration when prompted:
Should Terraform migrate your existing state? (yes/no): yes  
Validate Migration

Verify the state in the HCP Terraform workspace via the UI.
Ensure the workspace contains the migrated state file.
Post-Migration Updates

Trigger a new run to validate the workspace:
terraform apply  
Outputs
hcp_workspace_name (type: string) - Name of the HCP Terraform workspace.
state_migration_status (type: string) - Status of the state migration.
hcp_workspace_url (type: string) - URL of the HCP Terraform workspace for management.
Validation & Cleanup
Validate migration by verifying state consistency between local and HCP Terraform.
Deploy a sample change to confirm the state functionality in HCP Terraform.
Clean up resources and remove the local state file:
terraform destroy  
rm terraform.tfstate  
Optionally delete the HCP Terraform workspace if no longer required.
