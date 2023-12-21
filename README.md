# Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines

- Welcome to this comprehensive guide on automating the creation of Windows VMs with Custom (Golden) Images via Packer and Terraform through Azure DevOps CI/CD Pipelines. This Readme provides detailed instructions on the process, ensuring seamless and efficient deployment for all five applications.

# Let's get started!

Prerequisites :
- An Azure account with an active subscription. <a href="https://azure.microsoft.com/en-us/free/?WT.mc_id=A261C142F" target="_blank">Create an account for free.</a> 
- Azure DevOps Account, Organization and a Project
- Service Principal and Service Connection
- Storage Account & Container for remote tf state file
- Code Repository (Azure Repo)
#

# Repository Explanation:

- In the repository, I have  <a href="https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/tree/main/Terraform" target="_blank">Terraform Folder</a>  which has Terraform codes and configs.



- <a href="https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/blob/main/golden-image-windows-2019.json" target="_blank">golden-image-windows-2019.json</a>  & <a href="https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/blob/main/windows-variables.json" target="_blank">windows-variables.json</a> are Packer Image files written in Json format.


- <a href="https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/tree/main/scripts" target="_blank">scripts folder</a> has PowerShell scripts to install the desired softwares & tools into the custom image.

  
- <a href="https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/blob/main/Terraform-Packer-VM-Automation.yml" target="_blank">Terraform Pipeline</a> & <a href="https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/blob/main/Packer-Golden-Image-Build.yml" target="_blank">Packer Image Pipeline</a>


# Project Task and Steps:

### We are going to install the following softwares & tools in the Packer image which are necessary for any Cloud & DevOps Person:

- Git
- VS Code
- Terraform
- Azure CLI

#

## Creating Custom Image with Packer Explanation

### Step 1: Preparing the Packer Image

We are going to use Builders (azure-arm) and Provisioners which we make our configurations/installations under by referencing our PS scripts.

![Screenshot 2023-12-21 at 1 22 01 PM](https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/assets/113396342/a200960a-4b60-4abe-9f5e-23bfe4a9154f)

#

### Step 2: Setting Up Branch Policies and Packer Pipelines

As we are trying to do as close as possible to real world work environment, I set up branch policies tied to pipelines which will trigger the Packer Pipelines upon PR to main from a feature branch if there are any changes in the .json Packer files.

![Screenshot 2023-12-21 at 11 44 31 AM](https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/assets/113396342/f9187cc7-b14a-4abc-a6ae-72d39d5acbfc)

![Screenshot 2023-12-21 at 11 43 03 AM](https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/assets/113396342/c55b2c1f-0b28-4c31-9c84-c5478e30d948)

Please see the Pipeline jobs/tasks. Image build process approximately takes 15-20min
  - You can also see the detailed info outputs of the created image as I configured that in the pipeline that way :)

![Screenshot 2023-12-21 at 12 04 05 PM](https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/assets/113396342/f1c37469-d22b-46b6-86a1-e5d4841b5a5b)

#

### step 3: Checking the Image

Make sure to check your new custom image from Azure Portal under your RG or Images

![Screenshot 2023-12-21 at 12 07 06 PM](https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/assets/113396342/0e4914fe-51c1-406a-add7-5c9c3ee253d1)
#

## Creating Azure Virtual Machine from Built Packer Image

### Step 1: Preparing Azure Resources for VM Deployment

To be able to deploy a new VM, we need couple dependant resources to deploy before:

- Resource Group
- Virtual Network
- Subnet
- Nsg
- Nic
- Pip
- NSG & SUBNET ASSOCIATION
  
### Terraform code based on MODULE structure is ready for these reasources in the  <a href="https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/tree/main/Terraform" target="_blank">Terraform Folder</a> 

### Step 2: Branch Policies and Terraform Pipelines

As we are trying to do as close as possible to real world work environment, I set up branch policies tied to pipelines which will trigger the Terraform Pipeline upon PR to main from a feature branch if there are any changes in the Terraform folder.

![Screenshot 2023-12-21 at 11 44 31 AM copy](https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/assets/113396342/0c7152bc-2560-4a6b-8a10-5411bb55b82d)

Please see the Pipeline jobs/tasks. 

![Screenshot 2023-12-21 at 12 26 23 PM](https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/assets/113396342/7bbdf628-6f85-4521-841d-c733e80777aa)

#### It's okay if Checkov stage is failing as this is demo :) Configured to continue on ERROR.

![Screenshot 2023-12-21 at 12 29 41 PM](https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/assets/113396342/e6816007-482f-42d2-a308-c8b81362e55d)

#### We are going to deploy our resources on Release pipeline. For this, we need to have a artifact to pass our files over to Releases. 
This is configured in the pipeline.

![Screenshot 2023-12-21 at 9 20 56 AM](https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/assets/113396342/60a4674c-f7fd-4303-9183-cdc5fa76f758)


#

### Step 3: Configuring the CD (Release) Pipeline 

Once our CI pipeline is succesfuly done, our CD (Release) pipeline will be automatically triggered as we set the artifact to lates one of CI pipeline with Continuous deployment trigger enabled

#### We do Terraform Plan one more time to make sure everything is good to go! Then, as I set up pre-approval for the Terraform apply, we have to approve it and our deployment process should start :)

![Screenshot 2023-12-21 at 9 21 15 AM](https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/assets/113396342/6a2e2d04-57f0-4468-8d8e-6848aae42bd6)

#

### Step 4: Terraform Apply and Resource Deployment

 Once Terraform Apply is done, you can kindly check them from Azure Portal

![Screenshot 2023-12-21 at 1 58 53 PM](https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/assets/113396342/9e2a85df-c8c6-4fe5-b1ee-cf01734f3f89)

#

### Step 5: Connecting to the Deployed VM via RDP

As the final step, we need to connect to our VM through RDP to check if our softwares/tools are properly installed.

![Screenshot 2023-12-21 at 12 33 33 PM](https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/assets/113396342/a2351c28-9f94-4c73-a3be-62531128a9c9)

#

## RESULT


![Screenshot 2023-12-21 at 11 35 43 AM](https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/assets/113396342/db08e3ab-914e-4495-b0d9-b643539a4675)
