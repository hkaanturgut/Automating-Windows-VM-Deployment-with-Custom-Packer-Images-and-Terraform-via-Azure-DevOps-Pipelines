# Install Git
Invoke-WebRequest -Uri 'https://github.com/git-for-windows/git/releases/download/v2.35.1.windows.1/Git-2.35.1-64-bit.exe' -OutFile 'git-installer.exe'
Start-Process -FilePath 'git-installer.exe' -ArgumentList '/SILENT /NORESTART /CLOSEAPPLICATIONS'
Start-Sleep -Seconds 300  # Wait for 5 minutes to ensure Git installation completes

# Add Git to PATH
$gitPath = 'C:\Program Files\Git\cmd'
[System.Environment]::SetEnvironmentVariable('PATH', "$env:PATH;$gitPath", [System.EnvironmentVariableTarget]::Machine)
