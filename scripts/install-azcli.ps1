# install-azcli.ps1

# Define the installation directory (you can change this if needed)
$installDir = "$env:USERPROFILE\AzureCLI"

# Define the URL for the Azure CLI installer
$azCliInstallerUrl = "https://aka.ms/installazurecliwindows"

# Define the installer file path
$installerPath = "$env:TEMP\AzureCLI.msi"

# Download Azure CLI installer
Invoke-WebRequest -Uri $azCliInstallerUrl -OutFile $installerPath

# Install Azure CLI silently
Start-Process -FilePath 'msiexec.exe' -ArgumentList "/i $installerPath /quiet" -Wait

# Add Azure CLI to PATH
$env:Path += ";$installDir"

# Clean up the installer
Remove-Item -Path $installerPath -Force
