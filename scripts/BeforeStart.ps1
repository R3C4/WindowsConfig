
# Activate

Invoke-RestMethod https://massgrave.dev/get | Invoke-Expression

# Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `" `"" -Verb RunAs
winget settings --enable InstallerHashOverride

# Upgrade Windows 
Start-Process powershell "-ExecutionPolicy RemoteSigned -NoProfile -NoExit -Command `"Install-Module PSWindowsUpdate -AllowClobber -AcceptAll ;Import-Module PSWindowsUpdate ;Get-WindowsUpdate ;Install-WindowsUpdate -AcceptAll ;`"" -Verb RunAs

# Upgrade Windows store apps 
winget upgrade --all --force --ignore-security-hash