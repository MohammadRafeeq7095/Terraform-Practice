Topics discussed in today's class
-----------------------------------------
1. Build a Custom Network and Launch an EC2 Instance in Terraform
2. Import Existing Infrastructure into Terraform
----------------------------------------------------------------------------------
## Import Existing Infrastructure into Terraform
**Terraform Import** is a command used to bring existing infrastructure resources under Terraform's management by importing their current state into the Terraform state file (`terraform.tfstate`). It enables Terraform to track and manage those resources going forward.

### Use Cases:
- Manage manually created resources.
- Bring legacy infrastructure under Terraform's control.

### Steps for importing resources into Terraform

### 1. Create the Resource
Use the AWS Management Console, CLI, or API to create new resource.  
Use the following AWS CLI command to work with EC2. Replace *image-id* and *key-name* with your specific values.
```
aws ec2 run-instances --image-id ami-07d9cf938edb0739b --instance-type t2.micro --key-name newkey --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=EC2}]'
```

### 2. Prepare Terraform Configuration
Write the resource block in the Terraform configuration file that matches the resource you want to import.  
**Example for an AWS EC2 instance**

```
resource "aws_instance" "ec2" {
  
}
```

### 3. Run the Terraform Import Command
Use the terraform import command to import the resource into the Terraform state file.  
**Command**
```
terraform import [resource_type.resource_name] [resource_id]
```
**Example**
```
terraform import aws_instance.ec2 i-07a29de684bf20899
```

### 4. Verify the Resource is Imported
After running the import command:
- Terraform adds the resource to the state file (terraform.tfstate).
- The resource configuration (in .tf files) still needs to match the imported resource.
Check the imported resource:
```
terraform state list
```
### 5. Update Configuration to Match the Imported Resource
- The imported resource configuration in your .tf file should match the actual state of the resource.
- Add the necessary arguments (e.g., instance type, tags) to the resource block if they are not already present.
```
resource "aws_instance" "ec2" {
  ami           = "ami-07d9cf938edb0739b" # Change to your ami ID
  instance_type = "t2.micro"
  key_name      = "newkey" # Change to your key name
  tags = {
    Name = "EC2"
  }
}
```
### 6. Test the Terraform Configuration
Run terraform plan to ensure there are no changes required by Terraform:
```
terraform plan
```