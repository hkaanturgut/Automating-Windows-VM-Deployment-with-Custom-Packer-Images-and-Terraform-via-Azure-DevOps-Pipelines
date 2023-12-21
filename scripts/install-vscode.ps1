# install-vscode.ps1

# Define the download URL for the latest stable VSCode
$vscodeUrl = "https://update.code.visualstudio.com/latest/win32-x64/stable"

# Define the installation directory (you can change this if needed)
$installDir = "$env:USERPROFILE\VSCode"

# Define the VSCode installer file path
$installerPath = "$env:TEMP\VSCodeInstaller.exe"

# Download VSCode installer
Invoke-WebRequest -Uri $vscodeUrl -OutFile $installerPath

# Install VSCode silently
Start-Process -FilePath $installerPath -ArgumentList "/silent", "/mergetasks=!runcode" -Wait

# Clean up the installer
Remove-Item -Path $installerPath -Force
