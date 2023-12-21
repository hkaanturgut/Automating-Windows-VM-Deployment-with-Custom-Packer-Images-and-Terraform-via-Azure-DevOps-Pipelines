# Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines

- Welcome to this comprehensive guide on automating the creation of Windows VMs with Custom (Golden) Images through Packer and Terraform, orchestrated by Azure DevOps CI/CD Pipelines. This README provides step-by-step instructions, ensuring a seamless and efficient deployment process for all five applications.

Let's begin!

# Let's get started!

Prerequisites :
- An Azure account with an active subscription. <a href="https://azure.microsoft.com/en-us/free/?WT.mc_id=A261C142F" target="_blank">Create an account for free.</a> 
- Azure DevOps Account, Organization and a Project
- Service Principal and Service Connection
- Storage Account & Container for remote tf state file
- Code Repository (Azure Repo)
#

# Repository Explanation:

#### In this repository, you'll find the following components:

- In the repository, I have  <a href="https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/tree/main/Terraform" target="_blank">Terraform Folder</a>  which has Terraform codes and configs.



- <a href="https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/blob/main/golden-image-windows-2019.json" target="_blank">golden-image-windows-2019.json</a>  & <a href="https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/blob/main/windows-variables.json" target="_blank">windows-variables.json</a> are Packer Image files written in Json format.


- <a href="https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/tree/main/scripts" target="_blank">scripts folder</a> has PowerShell scripts to install the desired softwares & tools into the custom image.

  
- <a href="https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/blob/main/Terraform-Packer-VM-Automation.yml" target="_blank">Terraform Pipeline</a> & <a href="https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/blob/main/Packer-Golden-Image-Build.yml" target="_blank">Packer Image Pipeline</a>


# Project Task and Steps:

### We aim to automate the installation of the following software and tools within the Packer image, crucial for any Cloud & DevOps professional:

- Git
- VS Code
- Terraform
- Azure CLI

#

## Creating Custom Image with Packer Explanation

### Step 1: Preparing the Packer Image

In this step, we utilize Packer's Builders (azure-arm) and Provisioners to configure and install software components using PowerShell scripts.

![Screenshot 2023-12-21 at 1 22 01 PM](https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/assets/113396342/a200960a-4b60-4abe-9f5e-23bfe4a9154f)

#

### Step 2: Setting Up Branch Policies and Packer Pipelines

To emulate real-world work environments, we establish branch policies linked to pipelines. These policies trigger Packer Pipelines upon Pull Requests (PRs) to the main branch, ensuring proper handling of changes in .json Packer files.

![Screenshot 2023-12-21 at 11 44 31 AM](https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/assets/113396342/f9187cc7-b14a-4abc-a6ae-72d39d5acbfc)

![Screenshot 2023-12-21 at 11 43 03 AM](https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/assets/113396342/c55b2c1f-0b28-4c31-9c84-c5478e30d948)

Please see the Pipeline jobs/tasks. Image build process approximately takes 15-20min
  - You can also see the detailed info outputs of the created image as I configured that in the pipeline that way :)

![Screenshot 2023-12-21 at 12 04 05 PM](https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/assets/113396342/f1c37469-d22b-46b6-86a1-e5d4841b5a5b)

#

### step 3: Checking the Image

After the Packer image build process, it's essential to verify the newly created custom image. You can easily access it from the Azure Portal under your Resource Group (RG) or Images.

![Screenshot 2023-12-21 at 12 07 06 PM](https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/assets/113396342/0e4914fe-51c1-406a-add7-5c9c3ee253d1)
#

## Creating Azure Virtual Machine from Built Packer Image

### Step 1: Preparing Azure Resources for VM Deployment

Before deploying a new VM, we need to configure several dependent resources, including Resource Groups, Virtual Networks, Subnets, Network Security Groups (NSG), Network Interface Cards (NIC), and Public IP addresses (Pip). Our Terraform code, structured in modules, automates this setup.
  
### Terraform code based on MODULE structure is ready for these reasources in the  <a href="https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/tree/main/Terraform" target="_blank">Terraform Folder</a> 

### Step 2: Branch Policies and Terraform Pipelines

To mirror real-world scenarios, branch policies tied to pipelines trigger Terraform Pipelines upon PRs to the main branch when changes occur in the Terraform folder.

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

Upon successful completion of the CI pipeline, the CD (Release) pipeline activates automatically. We ensure that the latest artifact from the CI pipeline is used for continuous deployment. 

#### Additionally, we conduct a Terraform Plan to validate the configuration and await approval before applying the changes.

![Screenshot 2023-12-21 at 9 21 15 AM](https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/assets/113396342/6a2e2d04-57f0-4468-8d8e-6848aae42bd6)

#

### Step 4: Terraform Apply and Resource Deployment

After receiving approval, the Terraform Apply command deploys the defined resources. You can monitor the deployment's status in the Azure Portal.

![Screenshot 2023-12-21 at 1 58 53 PM](https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/assets/113396342/982a81f0-0d77-4702-8e50-65705cdddefe)


#

### Step 5: Connecting to the Deployed VM via RDP

The final step involves connecting to the deployed VM through Remote Desktop Protocol (RDP) to verify the proper installation of software and tools.

![Screenshot 2023-12-21 at 12 33 33 PM](https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/assets/113396342/a2351c28-9f94-4c73-a3be-62531128a9c9)

#

## RESULT

### With this comprehensive automation process, you can efficiently create Windows VMs from custom Packer images and deploy essential resources, all managed through Azure DevOps Pipelines.

![Screenshot 2023-12-21 at 11 35 43 AM](https://github.com/hkaanturgut/Automating-Windows-VM-Deployment-with-Custom-Packer-Images-and-Terraform-via-Azure-DevOps-Pipelines/assets/113396342/db08e3ab-914e-4495-b0d9-b643539a4675)
