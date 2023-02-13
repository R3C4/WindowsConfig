
# Setup Package Manager


# install powershell 8
winget install -e --id Microsoft.PowerShell --force --ignore-security-hash  
# winget
# Invoke-WebRequest -Uri "https://github.com/microsoft/winget-cli/releases/latest/*.msixbundle" -OutFile "C:\path\file"
winget install -e --id SomePythonThings.WingetUIStore --force --ignore-security-hash  


# chochlatey

# Set directory for installation - Chocolatey does not lock
# down the directory if not the default
# $InstallDir='C:\ProgramData\chocolatey';$env:ChocolateyInstall="$InstallDir";iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))


# Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `"Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))`"" -Verb RunAs
# Set-ExecutionPolicy Bypass -Scope Process -Force; 
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'));

choco upgrade chocolatey  --confirm --force --force-dependencies --acceptlicense  
choco update chocolatey  --confirm --force --force-dependencies --acceptlicense  


choco install chocolateygui  --confirm --force --force-dependencies --acceptlicense  
choco upgrade chocolateygui  --confirm --force --force-dependencies --acceptlicense  


# scoop
# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
# Invoke-RestMethod get.scoop.sh | Invoke-Expression
Start-Process powershell "-ExecutionPolicy RemoteSigned -NoProfile -NoExit -Command `" Invoke-RestMethod get.scoop.sh | Invoke-Expression `""

# NuGet
winget install -e --id Microsoft.NuGet --force --ignore-security-hash  

# BoxStarter
choco install boxstarter  --confirm --force --force-dependencies --acceptlicense  


# ansible
