
Disable-UAC

Set-ExecutionPolicy Bypass -Scope Process -Force;

# run other scripts

# Before Start
#bs.ps1;
irm https://massgrave.dev/get | iex

Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `"winget settings --enable InstallerHashOverride`"" -Verb RunAs

# Upgrade Windows 
Start-Process powershell "-ExecutionPolicy RemoteSigned -NoProfile -NoExit -Command `"Install-Module PSWindowsUpdate -AllowClobber -AcceptAll ;Import-Module PSWindowsUpdate ;Get-WindowsUpdate ;Install-WindowsUpdate -AcceptAll ;`"" -Verb RunAs

# Upgrade Windows store apps 
winget upgrade --all --force --ignore-security-hash

# -------------------------------------------------------------------------------------------------------------------------------------------------

# Setup Package Manager


# install powershell 8
winget install -e --id Microsoft.PowerShell --force --ignore-security-hash  
# winget
# Invoke-WebRequest -Uri "https://github.com/microsoft/winget-cli/releases/latest/*.msixbundle" -OutFile "C:\path\file"
winget install -e --id SomePythonThings.WingetUIStore --force --ignore-security-hash  


# chochlatey

# Set directory for installation - Chocolatey does not lock
# down the directory if not the default
$InstallDir='C:\ProgramData\chocolatey';$env:ChocolateyInstall="$InstallDir";iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))


# Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `"Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))`"" -Verb RunAs


choco upgrade chocolatey  --confirm --force --force-dependencies --acceptlicense  
choco update chocolatey  --confirm --force --force-dependencies --acceptlicense  


choco install chocolateygui  --confirm --force --force-dependencies --acceptlicense  
choco upgrade chocolateygui  --confirm --force --force-dependencies --acceptlicense  


# scoop
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
Invoke-RestMethod get.scoop.sh | Invoke-Expression


# NuGet
winget install -e --id Microsoft.NuGet --force --ignore-security-hash  

# BoxStarter
choco install boxstarter  --confirm --force --force-dependencies --acceptlicense  


# ansible

# -------------------------------------------------------------------------------------------------------------------------------------------------

# DNS/DDNS
#dns.ps1;

$ControlDProfile  = Read-Host -Prompt 'Enter your ControlD Profile';
$ControlDClientUrl = "https://assets.controld.com/utility/controld.exe";
$CDCName = $ControlDProfile + ".exe";
$CDTemplate = "https://dns.controld.com/" + $ControlDProfile + "/";

$NIUrl = "https://www.noip.com/client/DUCSetup_v4_1_1.exe";
$NIName = "noip.exe";
$NetworkName = Read-Host -Prompt 'Enter your Network Name';



# Download DDNS no-ip
Invoke-WebRequest -Uri $NIUrl -OutFile $NIName;
Start-Process -Filepath $NIName -ArgumentList "/S" -Wait 


# Setup DDNS no-ip


# Set DNS to ControlD via Powershell
netsh dns add encryption server=76.76.2.141 dohtemplate=$CDTemplate ;
netsh interface ipv4 set dns name=$NetworkName static 76.76.2.141;

# Download ControlD
Invoke-WebRequest -Uri $ControlDClientUrl -OutFile $CDCName;
Start-Process -Filepath $CDCName -ArgumentList "/S" -Wait 

# set Task Scheduler to run every startup

# $Trigger= New-ScheduledTaskTrigger -AtStartup # Specify the trigger settings
# $User= "NT AUTHORITY\SYSTEM" # Specify the account to run the script
# $Action= New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "C:\PS\StartupScript.ps1" # Specify what program to run and with its parameters
# Register-ScheduledTask -TaskName "MonitorGroupMembership" -Trigger $Trigger -User $User -Action $Action -RunLevel Highest –Force # Specify the name of the task


# -------------------------------------------------------------------------------------------------------------------------------------------------


# Runtime / Language
#RuntimeLanguage.ps1;

# - NodeJS
winget install -e --id OpenJS.NodeJS --force --ignore-security-hash  

# - Python
winget install -e --id Python.Python.3.11 --force --ignore-security-hash  

# - Go
winget install -e --id GoLang.Go.1.19 --force --ignore-security-hash  

# - Rust
winget install -e --id Rustlang.Rust.GNU --force --ignore-security-hash  
winget install -e --id Rustlang.Rustup --force --ignore-security-hash  
winget install -e --id Rustlang.Rust.MSVC --force --ignore-security-hash  

# .NET
winget install -e --id Microsoft.DotNet.Framework.DeveloperPack_4 --force --ignore-security-hash  
winget install -e --id Microsoft.DotNet.Runtime.7 --force --ignore-security-hash  
winget install -e --id Microsoft.DotNet.SDK.7 --force --ignore-security-hash  
winget install -e --id Microsoft.DotNet.DesktopRuntime.7 --force --ignore-security-hash  
winget install -e --id Microsoft.DirectX --force --ignore-security-hash  

# C++
winget install -e --id Microsoft.VCRedist.2015+.x64 --force --ignore-security-hash  



#JAVA
winget install -e --id Oracle.JavaRuntimeEnvironment --force --ignore-security-hash  
winget install -e --id Oracle.JDK.19 --force --ignore-security-hash  

# - Yarn
winget install -e --id Yarn.Yarn --force --ignore-security-hash  

# - Docker
winget install -e --id Docker.DockerDesktop --force --ignore-security-hash  

# - Git
winget install -e --id Git.Git --force --ignore-security-hash  
winget install -e --id Gitlab.Runner --force --ignore-security-hash  
winget install -e --id Gitlab.Gitter --force --ignore-security-hash  
winget install -e --id GitHub.cli --force --ignore-security-hash  
winget install -e --id GitHub.GitHubDesktop --force --ignore-security-hash  
winget install -e --id GitHub.GitLFS --force --ignore-security-hash  
winget install -e --id Axosoft.GitKraken --force --ignore-security-hash  

# -------------------------------------------------------------------------------------------------------------------------------------------------

# VPN
#vpn.ps1;


# - Mullvad
winget install -e --id MullvadVPN.MullvadVPN --force --ignore-security-hash  

# - Torguard
winget install -e --id VPNetwork.TorGuard --force --ignore-security-hash  

# - Proton Products
winget install -e --id ProtonTechnologies.ProtonVPN --force --ignore-security-hash  
winget install -e --id ProtonTechnologies.ProtonMailBridge --force --ignore-security-hash  

# - windscribe
winget install -e --id Windscribe.Windscribe --force --ignore-security-hash  

# - SSH
winget install -e --id Bitvise.SSH.Client --force --ignore-security-hash  
winget install -e --id Termius.Termius --force --ignore-security-hash  
winget install -e --id PuTTY.PuTTY --force --ignore-security-hash  
winget install -e --id NoMoreFood.PuTTY-CAC --force --ignore-security-hash  

#Proxifier
winget install -e --id Initex.Proxifier --force --ignore-security-hash  

# YogaDNS
winget install -e --id Initex.YogaDNS --force --ignore-security-hash  

# - OpenVPN
winget install -e --id OpenVPNTechnologies.OpenVPNConnect --force --ignore-security-hash  
winget install -e --id OpenVPNTechnologies.OpenVPN --force --ignore-security-hash  

# - wireguard
winget install -e --id WireGuard.WireGuard --force --ignore-security-hash  

# - Nord
winget install -e --id NordVPN.NordVPN --force --ignore-security-hash  

# - bitdefender
Invoke-WebRequest -Uri "https://download.bitdefender.com/windows/installer/en-us/bitdefender_tsecurity.exe" -OutFile 'BDP.exe'
Start-Process -Filepath "BDP.exe" -ArgumentList "/S" -Wait 

# - express
winget install -e --id ExpressVPN.ExpressVPN --force --ignore-security-hash  

# - cisco
choco install openconnect-gui  --confirm --force --force-dependencies --acceptlicense  

# - softether
choco install softether-vpn-client  --confirm --force --force-dependencies --acceptlicense  

# - tor
choco install tor-browser  --confirm --force --force-dependencies --acceptlicense  

# - adguard
winget install -e --id AdGuard.AdGuard --force --ignore-security-hash  
winget install -e --id AdGuard.AdGuardVPN --force --ignore-security-hash  

# - Geph
Invoke-WebRequest -Uri "https://f001.backblazeb2.com/file/geph4-dl/geph-releases/windows-stable/4.7.5/geph-windows-setup.exe" -OutFile 'geph.exe'
Start-Process -Filepath "geph.exe" -ArgumentList "/S" -Wait 


# - netmod
Invoke-WebRequest -UserAgent "Wget"  -Uri "https://sourceforge.net/projects/netmodhttp/files/latest/download" -OutFile 'netmod.exe'
Start-Process -Filepath "netmod.exe" -ArgumentList "/S" -Wait 

# - tikvpn
Invoke-WebRequest -Uri  -OutFile 
Start-Process -Filepath "" -ArgumentList "/S" -Wait 

# - Clients


# -------------------------------------------------------------------------------------------------------------------------------------------------

# Windows Features
#windowsfeatures.ps1;

# -------------------------------------------------------------------------------------------------------------------------------------------------

# Social
#social.ps1;

# - Telegram
winget install -e --id Telegram.TelegramDesktop --force --ignore-security-hash  

# - Discord
winget install -e --id Discord.Discord --force --ignore-security-hash  

# - Whatsapp
winget install -e --id WhatsApp.WhatsApp --force --ignore-security-hash  

# - instagram


# - twitter


# - twitch
choco install twitch  --confirm --force --force-dependencies --acceptlicense  

# - slack
winget install -e --id SlackTechnologies.Slack --force --ignore-security-hash  

# - signal
winget install -e --id OpenWhisperSystems.Signal --force --ignore-security-hash  

# Skype
winget install -e --id Microsoft.Skype --force --ignore-security-hash  



# -------------------------------------------------------------------------------------------------------------------------------------------------

# Browser
#browser.ps1;


# - chrome
winget install -e --id Google.Chrome --force --ignore-security-hash  

# Chrome dev
winget install -e --id Google.Chrome.Dev --force --ignore-security-hash  

# - ungoogled chromium
winget install -e --id eloston.ungoogled-chromium --force --ignore-security-hash  

# - brave
winget install -e --id Brave.Brave --force --ignore-security-hash  

# - firefox
winget install -e --id Mozilla.Firefox --force --ignore-security-hash  

# - firefox DE
winget install -e --id Mozilla.Firefox.DeveloperEdition --force --ignore-security-hash  

# - tor

# - opera
winget install -e --id Opera.Opera --force --ignore-security-hash  
winget install -e --id Opera.OperaGX --force --ignore-security-hash  

#Libre wolf
winget install -e --id LibreWolf.LibreWolf --force --ignore-security-hash  

# - undetectable.io

# - anty.dolphin.ru.com

# - hydraproxy.com/hydraheaders

# - incogniton.com

# - multilogin.com

# - ru.aezakmi.run

# - adspower.net

# - ghostbrowser.com

# - clonbrowser.com

# - undetectable.io

# - xlogin.us

# - sphere.tenebris.cc

# - ru.aezakmi.run

# - gologin.com

# -------------------------------------------------------------------------------------------------------------------------------------------------

# Game
#game.ps1;


# - Epic
winget install -e --id EpicGames.EpicGamesLauncher --force --ignore-security-hash  

# - Steam
winget install -e --id Valve.Steam --force --ignore-security-hash  

# - EA
winget install -e --id ElectronicArts.EADesktop --force --ignore-security-hash  

# - Ubisoft
winget install -e --id Ubisoft.Connect --force --ignore-security-hash  

# - Origin
Invoke-WebRequest -Uri "https://origin-a.akamaihd.net/Origin-Client-Download/origin/live/OriginThinSetup.exe" -OutFile 'origin.exe'
Start-Process -Filepath "origin.exe" -ArgumentList "/S" -Wait winget install --silent

# - Battlenet
Invoke-WebRequest -Uri "https://www.battle.net/download/getInstallerForGame?os=win&gameProgram=BATTLENET_APP&version=Live" -OutFile 'battlenet.exe'
Start-Process -Filepath "battlenet.exe" -ArgumentList "/S" -Wait winget install --silent

# - Bethesda
winget install -e --id Bethesda.Launcher --force --ignore-security-hash  

# - GOG GALAXY
winget install -e --id GOG.Galaxy --force --ignore-security-hash  

# - Amazon Gameing Platform
winget install -e --id Amazon.Games --force --ignore-security-hash  

# - Uplay

# - Rockstar Games Launcher
choco install rockstar-launcher  --confirm --force --force-dependencies --acceptlicense  



# -------------------------------------------------------------------------------------------------------------------------------------------------

# Utils
#utile.ps1;

# - Download Manager
winget install -e --id Tonec.InternetDownloadManager --force --ignore-security-hash  
winget install -e --id qBittorrent.qBittorrent --force --ignore-security-hash  

# - Video Player
winget install -e --id VideoLAN.VLC --force --ignore-security-hash  
winget install -e --id Streamlink.Streamlink --force --ignore-security-hash  
winget install -e --id Daum.PotPlayer --force --ignore-security-hash  
winget install -e --id Dio.PureCodec --force --ignore-security-hash  

#     - 30nama
Invoke-WebRequest -Uri "https://github.com/Mr30nama/30nama/releases/download/v0.9.7/30nama-Setup-0.9.7.exe" -OutFile '30nama.exe'
Start-Process -Filepath "30nama.exe" -ArgumentList "/S" -Wait winget install --silent


#     - stereamio
Invoke-WebRequest -Uri "https://www.strem.io/download?four=4" -OutFile 'streamio.exe'
Start-Process -Filepath "streamio.exe" -ArgumentList "/S" -Wait winget install --silent

# AnyDesk
winget install -e --id AnyDeskSoftwareGmbH.AnyDesk --force --ignore-security-hash  

# Rufus Ventoy
winget install -e --id Rufus.Rufus --force --ignore-security-hash  


# - Music Player
winget install -e --id Spotify.Spotify --force --ignore-security-hash  
winget install -e --id Winamp.Winamp --force --ignore-security-hash  
winget install -e --id Deezer.Deezer --force --ignore-security-hash  
winget install -e --id nukeop.nuclear --force --ignore-security-hash  
winget install -e --id staniel359.muffon --force --ignore-security-hash  
winget install -e --id TIDALMusicAS.TIDAL --force --ignore-security-hash  

# - Zip
winget install -e --id Bandisoft.Bandizip --force --ignore-security-hash  
winget install -e --id 7zip.7zip --force --ignore-security-hash  
winget install -e --id RARLab.WinRAR --force --ignore-security-hash  

# - putty
winget install -e --id PuTTY.PuTTY --force --ignore-security-hash  

# - winscp
winget install -e --id WinSCP.WinSCP --force --ignore-security-hash  

# - speedtest 
winget install -e --id Ookla.Speedtest --force --ignore-security-hash  

# - vmware
winget install -e --id VMware.WorkstationPro --force --ignore-security-hash  

# - virtualbox
winget install -e --id Oracle.VirtualBox --force --ignore-security-hash  

# - anydesk
winget install -e --id AnyDeskSoftwareGmbH.AnyDesk --force --ignore-security-hash  

# - Mega 
winget install -e --id Mega.MEGASync --force --ignore-security-hash  

# - notion
winget install -e --id Notion.Notion --force --ignore-security-hash  
winget install -e --id NotionRepackaged.NotionEnhanced --force --ignore-security-hash  

# Obsidian
winget install -e --id Obsidian.Obsidian --force --ignore-security-hash  

# - solar putty

# - Terminal
winget install -e --id Microsoft.WindowsTerminal --force --ignore-security-hash  

# - Bitwarden
winget install -e --id Bitwarden.Bitwarden --force --ignore-security-hash  

# - winget UI
winget install -e --id SomePythonThings.WingetUIStore --force --ignore-security-hash  

# - Thunderbirad
winget install -e --id Mozilla.Thunderbird --force --ignore-security-hash  

# - Microsoft
winget install -e --id Microsoft.PowerToys --force --ignore-security-hash  
winget install -e --id Microsoft.PowerAppsCLI --force --ignore-security-hash  
winget install -e --id Microsoft.PCManager --force --ignore-security-hash  
winget install -e --id Microsoft.Sysinternals.ProcessExplorer --force --ignore-security-hash  
winget install -e --id Microsoft.Sysinternals.ProcessMonitor --force --ignore-security-hash  
winget install -e --id Microsoft.WindowsPCHealthCheck --force --ignore-security-hash  
winget install -e --id Microsoft.quicreach --force --ignore-security-hash  
winget install -e --id Microsoft.PIX --force --ignore-security-hash  


# Streams
winget install -e --id Streamlabs.Streamlabs --force --ignore-security-hash  
winget install -e --id Streamlabs.StreamlabsOBS --force --ignore-security-hash  
winget install -e --id Streamlink.Streamlink --force --ignore-security-hash  
winget install -e --id OBSProject.OBSStudio --force --ignore-security-hash  


# -------------------------------------------------------------------------------------------------------------------------------------------------

# WSL
#wsl.ps1;

winget install -e --id opticos.gwsl --force --ignore-security-hash  

# -------------------------------------------------------------------------------------------------------------------------------------------------

# Ubuntu     
#ubuntu.ps1;

# -------------------------------------------------------------------------------------------------------------------------------------------------

# Debian
#debian.ps1;

# -------------------------------------------------------------------------------------------------------------------------------------------------

# Kali
#kali.ps1;

# -------------------------------------------------------------------------------------------------------------------------------------------------

# Terminal
#terminal.ps1;

winget install -e --id JanDeDobbeleer.OhMyPosh --force --ignore-security-hash  


# -------------------------------------------------------------------------------------------------------------------------------------------------

# Programming Tools
#ide.ps1;


# - DataBases
winget install -e --id MariaDB.Server --force --ignore-security-hash  
winget install -e --id MongoDB.Server --force --ignore-security-hash  
winget install -e --id MongoDB.DatabaseTools --force --ignore-security-hash  
winget install -e --id PostgreSQL.PostgreSQL --force --ignore-security-hash  
winget install -e --id Oracle.MySQL --force --ignore-security-hash  
winget install -e --id 3T.Robo3T --force --ignore-security-hash  

# - VS code
winget install -e --id Microsoft.VisualStudioCode --force --ignore-security-hash  


# - Visual Studio
winget install -e --id Microsoft.VisualStudio.2022.Community --force --ignore-security-hash  
winget install -e --id Microsoft.VisualStudio.2022.Enterprise --force --ignore-security-hash  


# - Jetbrains
winget install -e --id JetBrains.Toolbox --force --ignore-security-hash  



# -------------------------------------------------------------------------------------------------------------------------------------------------

# Graphic / Design
#creative.ps1;

# - Adobe
winget install -e --id Adobe.AdobeConnect --force --ignore-security-hash  


# - Figma
winget install -e --id Figma.fonthelper --force --ignore-security-hash  
winget install -e --id Figma.Figma --force --ignore-security-hash  

# - zeplin
choco install zeplin  --confirm --force --force-dependencies --acceptlicense  

# -------------------------------------------------------------------------------------------------------------------------------------------------

# Decentralize
#decentralize.ps1;

# - session
winget install -e --id Oxen.Session --force --ignore-security-hash  



# - bastyon

# -------------------------------------------------------------------------------------------------------------------------------------------------

# Other Devices
#Devices.ps1;

# Logitech
winget install -e --id Logitech.LogiBolt --force --ignore-security-hash  
winget install -e --id Logitech.OptionsPlus --force --ignore-security-hash  
winget install -e --id Logitech.LogiTune --force --ignore-security-hash  
winget install -e --id Logitech.GHUB --force --ignore-security-hash  
winget install -e --id Logitech.LGS --force --ignore-security-hash  
winget install -e --id Logitech.Options --force --ignore-security-hash  
winget install -e --id Logitech.SetPoint --force --ignore-security-hash  
winget install -e --id Logitech.UnifyingSoftware --force --ignore-security-hash  

# Razer
choco install razer-synapse-3  --confirm --force --force-dependencies --acceptlicense  


# Samsung
winget install -e --id Samsung.DeX --force --ignore-security-hash  
winget install -e --id Samsung.SmartSwitch --force --ignore-security-hash  
# - samsung dex
# - samsung flow

# Nvidia
winget install -e --id Nvidia.GeForceExperience --force --ignore-security-hash  
winget install -e --id Nvidia.GeForceNow --force --ignore-security-hash  
winget install -e --id MoonlightGameStreamingProject.Moonlight --force --ignore-security-hash  

# AMD


# -------------------------------------------------------------------------------------------------------------------------------------------------

# After Installations
#AfterInstallation.ps1;

# create scheduled task to run the script startup


# winget
# winget upgradewinget upgrade --all --silent



# Chochlatey
# choco upgrade all

# scoop
# scoop update
