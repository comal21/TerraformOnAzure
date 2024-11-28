* Use the Terraform state command to list all resources managed by Terraform. 
```
terraform state list
```

* Verify user creation
```
az ad user list --filter "department eq 'Education'" --query "[].{ department: department, name: displayName, jobTitle: jobTitle, pname: userPrincipalName }"
```
* Verify group creation and user assignment
```
az ad group list --query "[?contains(displayName,'Education')].{ name: displayName }" --output tsv
```
* 
