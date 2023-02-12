
Disable-UAC

Set-ExecutionPolicy Bypass -Scope Process -Force;

# run other scripts

# Before Start
.\bs.ps1;
irm https://massgrave.dev/get | iex


# -------------------------------------------------------------------------------------------------------------------------------------------------

# Setup Package Manager

# install powershell 8
winget install -e --id Microsoft.PowerShell
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

# -------------------------------------------------------------------------------------------------------------------------------------------------

# DNS/DDNS
.\dns.ps1;

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
.\RuntimeLanguage.ps1;

# - NodeJS
winget install -e --id OpenJS.NodeJS;

# - Python
winget install -e --id Python.Python.3.11;

# - Go
winget install -e --id GoLang.Go.1.19;

# - Rust
winget install -e --id Rustlang.Rust.GNU;
winget install -e --id Rustlang.Rustup;
winget install -e --id Rustlang.Rust.MSVC;

# .NET
winget install -e --id Microsoft.DotNet.Framework.DeveloperPack_4
winget install -e --id Microsoft.DotNet.Runtime.7
winget install -e --id Microsoft.DotNet.SDK.7
winget install -e --id Microsoft.DotNet.DesktopRuntime.7
winget install -e --id Microsoft.DirectX

# C++
winget install -e --id Microsoft.VCRedist.2015+.x64



#JAVA
winget install -e --id Oracle.JavaRuntimeEnvironment
winget install -e --id Oracle.JDK.19

# - Yarn
winget install -e --id Yarn.Yarn

# - Docker
winget install -e --id Docker.DockerDesktop

# - Git
winget install -e --id Git.Git
winget install -e --id Gitlab.Runner
winget install -e --id Gitlab.Gitter
winget install -e --id GitHub.cli
winget install -e --id GitHub.GitHubDesktop
winget install -e --id GitHub.GitLFS
winget install -e --id Axosoft.GitKraken

# -------------------------------------------------------------------------------------------------------------------------------------------------

# VPN
.\vpn.ps1;


# - Mullvad
winget install -e --id MullvadVPN.MullvadVPN

# - Torguard
winget install -e --id VPNetwork.TorGuard

# - Proton Products
winget install -e --id ProtonTechnologies.ProtonVPN
winget install -e --id ProtonTechnologies.ProtonMailBridge

# - windscribe
winget install -e --id Windscribe.Windscribe

# - SSH
winget install -e --id Bitvise.SSH.Client
winget install -e --id Termius.Termius
winget install -e --id PuTTY.PuTTY
winget install -e --id NoMoreFood.PuTTY-CAC

#Proxifier
winget install -e --id Initex.Proxifier

# YogaDNS
winget install -e --id Initex.YogaDNS

# - OpenVPN
winget install -e --id OpenVPNTechnologies.OpenVPNConnect
winget install -e --id OpenVPNTechnologies.OpenVPN

# - wireguard
winget install -e --id WireGuard.WireGuard

# - Nord
winget install -e --id NordVPN.NordVPN

# - bitdefender
Invoke-WebRequest -Uri "https://download.bitdefender.com/windows/installer/en-us/bitdefender_tsecurity.exe" -OutFile 'BDP.exe'
Start-Process -Filepath "BDP.exe" -ArgumentList "/S" -Wait 

# - express
winget install -e --id ExpressVPN.ExpressVPN

# - cisco
choco install openconnect-gui

# - softether
choco install softether-vpn-client

# - tor
choco install tor-browser

# - adguard
winget install -e --id AdGuard.AdGuard
winget install -e --id AdGuard.AdGuardVPN

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
.\windowsfeatures.ps1;

# -------------------------------------------------------------------------------------------------------------------------------------------------

# Social
.\social.ps1;

# - Telegram
winget install -e --id Telegram.TelegramDesktop

# - Discord
winget install -e --id Discord.Discord

# - Whatsapp
winget install -e --id WhatsApp.WhatsApp

# - instagram


# - twitter


# - twitch
choco install twitch

# - slack
winget install -e --id SlackTechnologies.Slack

# - signal
winget install -e --id OpenWhisperSystems.Signal

# Skype
winget install -e --id Microsoft.Skype



# -------------------------------------------------------------------------------------------------------------------------------------------------

# Browser
.\browser.ps1;


# - chrome
winget install -e --id Google.Chrome

# Chrome dev
winget install -e --id Google.Chrome.Dev

# - ungoogled chromium
winget install -e --id eloston.ungoogled-chromium

# - brave
winget install -e --id Brave.Brave

# - firefox
winget install -e --id Mozilla.Firefox

# - firefox DE
winget install -e --id Mozilla.Firefox.DeveloperEdition

# - tor

# - opera
winget install -e --id Opera.Opera
winget install -e --id Opera.OperaGX

#Libre wolf
winget install -e --id LibreWolf.LibreWolf

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
.\game.ps1;


# - Epic
winget install -e --id EpicGames.EpicGamesLauncher

# - Steam
winget install -e --id Valve.Steam

# - EA
winget install -e --id ElectronicArts.EADesktop

# - Ubisoft
winget install -e --id Ubisoft.Connect

# - Origin
Invoke-WebRequest -Uri "https://origin-a.akamaihd.net/Origin-Client-Download/origin/live/OriginThinSetup.exe" -OutFile 'origin.exe'
Start-Process -Filepath "origin.exe" -ArgumentList "/S" -Wait winget install --silent

# - Battlenet
Invoke-WebRequest -Uri "https://www.battle.net/download/getInstallerForGame?os=win&gameProgram=BATTLENET_APP&version=Live" -OutFile 'battlenet.exe'
Start-Process -Filepath "battlenet.exe" -ArgumentList "/S" -Wait winget install --silent

# - Bethesda
winget install -e --id Bethesda.Launcher

# - GOG GALAXY
winget install -e --id GOG.Galaxy

# - Amazon Gameing Platform
winget install -e --id Amazon.Games

# - Uplay

# - Rockstar Games Launcher
choco install rockstar-launcher



# -------------------------------------------------------------------------------------------------------------------------------------------------

# Utils
.\utile.ps1;

# - Download Manager
winget install -e --id Tonec.InternetDownloadManager
winget install -e --id qBittorrent.qBittorrent

# - Video Player
winget install -e --id VideoLAN.VLC
winget install -e --id Streamlink.Streamlink
winget install -e --id Daum.PotPlayer
winget install -e --id Dio.PureCodec

#     - 30nama
Invoke-WebRequest -Uri "https://github.com/Mr30nama/30nama/releases/download/v0.9.7/30nama-Setup-0.9.7.exe" -OutFile '30nama.exe'
Start-Process -Filepath "30nama.exe" -ArgumentList "/S" -Wait winget install --silent


#     - stereamio
Invoke-WebRequest -Uri "https://www.strem.io/download?four=4" -OutFile 'streamio.exe'
Start-Process -Filepath "streamio.exe" -ArgumentList "/S" -Wait winget install --silent

# AnyDesk
winget install -e --id AnyDeskSoftwareGmbH.AnyDesk

# Rufus Ventoy
winget install -e --id Rufus.Rufus


# - Music Player
winget install -e --id Spotify.Spotify
winget install -e --id Winamp.Winamp
winget install -e --id Deezer.Deezer
winget install -e --id nukeop.nuclear
winget install -e --id staniel359.muffon
winget install -e --id TIDALMusicAS.TIDAL

# - Zip
winget install -e --id Bandisoft.Bandizip
winget install -e --id 7zip.7zip
winget install -e --id RARLab.WinRAR

# - putty
winget install -e --id PuTTY.PuTTY

# - winscp
winget install -e --id WinSCP.WinSCP

# - speedtest 
winget install -e --id Ookla.Speedtest

# - vmware
winget install -e --id VMware.WorkstationPro

# - virtualbox
winget install -e --id Oracle.VirtualBox

# - anydesk
winget install -e --id AnyDeskSoftwareGmbH.AnyDesk

# - Mega 
winget install -e --id Mega.MEGASync

# - notion
winget install -e --id Notion.Notion
winget install -e --id NotionRepackaged.NotionEnhanced

# Obsidian
winget install -e --id Obsidian.Obsidian

# - solar putty

# - Terminal
winget install -e --id Microsoft.WindowsTerminal

# - Bitwarden
winget install -e --id Bitwarden.Bitwarden

# - winget UI
winget install -e --id SomePythonThings.WingetUIStore

# - Thunderbirad
winget install -e --id Mozilla.Thunderbird

# - Microsoft
winget install -e --id Microsoft.PowerToys
winget install -e --id Microsoft.PowerAppsCLI
winget install -e --id Microsoft.PCManager
winget install -e --id Microsoft.Sysinternals.ProcessExplorer
winget install -e --id Microsoft.Sysinternals.ProcessMonitor
winget install -e --id Microsoft.WindowsPCHealthCheck
winget install -e --id Microsoft.quicreach
winget install -e --id Microsoft.PIX


# Streams
winget install -e --id Streamlabs.Streamlabs
winget install -e --id Streamlabs.StreamlabsOBS
winget install -e --id Streamlink.Streamlink
winget install -e --id OBSProject.OBSStudio


# -------------------------------------------------------------------------------------------------------------------------------------------------

# WSL
.\wsl.ps1;

winget install -e --id opticos.gwsl

# -------------------------------------------------------------------------------------------------------------------------------------------------

# Ubuntu     
.\ubuntu.ps1;

# -------------------------------------------------------------------------------------------------------------------------------------------------

# Debian
.\debian.ps1;

# -------------------------------------------------------------------------------------------------------------------------------------------------

# Kali
.\kali.ps1;

# -------------------------------------------------------------------------------------------------------------------------------------------------

# Terminal
.\terminal.ps1;

winget install -e --id JanDeDobbeleer.OhMyPosh


# -------------------------------------------------------------------------------------------------------------------------------------------------

# Programming Tools
.\ide.ps1;


# - DataBases
winget install -e --id MariaDB.Server
winget install -e --id MongoDB.Server
winget install -e --id MongoDB.DatabaseTools
winget install -e --id PostgreSQL.PostgreSQL
winget install -e --id Oracle.MySQL
winget install -e --id 3T.Robo3T

# - VS code
winget install -e --id Microsoft.VisualStudioCode


# - Visual Studio
winget install -e --id Microsoft.VisualStudio.2022.Community
winget install -e --id Microsoft.VisualStudio.2022.Enterprise


# - Jetbrains
winget install -e --id JetBrains.Toolbox



# -------------------------------------------------------------------------------------------------------------------------------------------------

# Graphic / Design
.\creative.ps1;

# - Adobe
winget install -e --id Adobe.AdobeConnect


# - Figma
winget install -e --id Figma.fonthelper
winget install -e --id Figma.Figma

# - zeplin
choco install zeplin

# -------------------------------------------------------------------------------------------------------------------------------------------------

# Decentralize
.\decentralize.ps1;

# - session
winget install -e --id Oxen.Session



# - bastyon

# -------------------------------------------------------------------------------------------------------------------------------------------------

# Other Devices
.\Devices.ps1;

# Logitech
winget install -e --id Logitech.LogiBolt
winget install -e --id Logitech.OptionsPlus
winget install -e --id Logitech.LogiTune
winget install -e --id Logitech.GHUB
winget install -e --id Logitech.LGS
winget install -e --id Logitech.Options
winget install -e --id Logitech.SetPoint
winget install -e --id Logitech.UnifyingSoftware

# Razer
choco install razer-synapse-3


# Samsung
winget install -e --id Samsung.DeX
winget install -e --id Samsung.SmartSwitch
# - samsung dex
# - samsung flow

# Nvidia
winget install -e --id Nvidia.GeForceExperience
winget install -e --id Nvidia.GeForceNow
winget install -e --id MoonlightGameStreamingProject.Moonlight

# AMD


# -------------------------------------------------------------------------------------------------------------------------------------------------

# After Installations
.\AfterInstallation.ps1;

# create scheduled task to run the script startup


# winget
# winget upgradewinget upgrade --all --silent



# Chochlatey
# choco upgrade all

# scoop
# scoop update
