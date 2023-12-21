# install-terraform.ps1

# Define the Terraform version you want to install
$terraformVersion = "1.6.6"  # Replace with the desired version

# Set the download URL
$downloadUrl = "https://releases.hashicorp.com/terraform/$terraformVersion/terraform_${terraformVersion}_windows_amd64.zip"

# Define the installation directory (you can change this if needed)
$installDir = "$env:ProgramFiles\Terraform"

# Download Terraform
Invoke-WebRequest -Uri $downloadUrl -OutFile "$env:TEMP\terraform.zip"

# Create the installation directory if it doesn't exist
if (!(Test-Path -Path $installDir)) {
    New-Item -Path $installDir -ItemType Directory
}

# Extract Terraform to the installation directory (with -Force to overwrite existing files)
Expand-Archive -Path "$env:TEMP\terraform.zip" -DestinationPath $installDir -Force

# Add Terraform to the system's PATH
$env:Path = "$installDir;$env:Path"

# Verify the installation
$terraformVersionInstalled = terraform --version

if ($terraformVersionInstalled -match $terraformVersion) {
    Write-Host "Terraform $terraformVersionInstalled has been successfully installed."
} else {
    Write-Host "Failed to install Terraform."
}

# Clean up temporary files
Remove-Item "$env:TEMP\terraform.zip" -Force
