
# winget
# Invoke-WebRequest -Uri "https://github.com/microsoft/winget-cli/releases/latest/*.msixbundle" -OutFile "C:\path\file"
winget install -e --id SomePythonThings.WingetUIStore


# chochlatey
Set-ExecutionPolicy Bypass -Scope Process -Force; 
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'));

choco upgrade chocolatey


choco install chocolateygui
choco upgrade chocolateygui


# scoop
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
Invoke-RestMethod get.scoop.sh | Invoke-Expression


# NuGet
winget install -e --id Microsoft.NuGet


# ansible

