
Disable-UAC

Set-ExecutionPolicy Bypass -Scope CurrentUser -Force;


Install-Module PSMenu
Install-Module -Name InteractiveMenu -Force
Import-Module InteractiveMenu


$Scripts = 
    "BeforeStart",
    "PackageManager",
    "DNS",
    "RuntimeLanguage",
    "VPN",
    "WindowsFeatures",
    "Social",
    "Browser",
    "Game",
    "Utile",
    "WSL",
    "Ubuntu",
    "Debian",
    "Kali",
    "Terminal",
    "IDE",
    "Graphic",
    "Decentralize",
    "Devices",
    "AfterInstallation"


# First Let User Choose VPN

$VPNItems = @(
    Get-InteractiveChooseMenuOption `
        -Label "Geph" `
        -Value "RunGeph" `
        -Info "Geph"
    Get-InteractiveChooseMenuOption `
        -Label "Windscribe" `
        -Value "RunWindscribe" `
        -Info "Windscribe WSTunnel and Stealth"
    Get-InteractiveChooseMenuOption `
        -Label "Mullvad" `
        -Value "RunMullvad" `
        -Info "Mullvad With SSH and V2ray Bridge"
    Get-InteractiveChooseMenuOption `
        -Label "TorGuardVPN" `
        -Value "RunTorGuardVPN" `
        -Info "TorGuardVPN With AnyConnect and OpenVPN"
    Get-InteractiveChooseMenuOption `
        -Label "TorGuardProxy" `
        -Value "RunTorGuardProxy" `
        -Info "TorGuardProxy With SSH and V2ray Servers on Nekoray or V2rayA or V2rayN"
    Get-InteractiveChooseMenuOption `
        -Label "ControlD" `
        -Value "RunControlD" `
        -Info "ControlD DNS DOH and Legacy"
)

$SelectVPNTitle = "Choose Your VPN For Starting Script to Bypass Restrictions"

$SelectedVPN = Get-InteractiveMenuChooseUserSelection -Question $SelectVPNTitle -Answers $VPNItems



# Second Let User Choose Scripts


$ScriptsItems = @(
    Get-InteractiveMultiMenuOption `
        -Item "BeforeStart" `
        -Label "Before Start" `
        -Order 0 `
        -Info "Activate windows" `
        -Selected
    Get-InteractiveMultiMenuOption `
        -Item "PackageManager" `
        -Label "Package Manger" `
        -Order 1 `
        -Info "Install Winget , Chochlatey , Scoop , NuGet and Upgrade Windows" `
        -Selected
    Get-InteractiveMultiMenuOption `
        -Item "DNS" `
        -Label "DNS / DDNS" `
        -Order 2 `
        -Info "Setup ControlD and DDNS" `
        -Selected
    Get-InteractiveMultiMenuOption `
        -Item "RuntimeLanguage" `
        -Label "Runtime / Language" `
        -Order 3 `
        -Info "Install Runtimes and Programming Languages" `
        -Selected
    Get-InteractiveMultiMenuOption `
        -Item "VPN" `
        -Label "VPN" `
        -Order 4 `
        -Info "Install VPN Software and Protocol" `
        -Selected
    Get-InteractiveMultiMenuOption `
        -Item "WindowsFeatures" `
        -Label "Enable Windows Features" `
        -Order 5 `
        -Info "Enable Windows Features" `
        -Selected
    Get-InteractiveMultiMenuOption `
        -Item "Social" `
        -Label "Social Media" `
        -Order 6 `
        -Info "Install Social Media" `
        -Selected
    Get-InteractiveMultiMenuOption `
        -Item "Browser" `
        -Label "Browser" `
        -Order 7 `
        -Info "Install Browser" `
        -Selected
    Get-InteractiveMultiMenuOption `
        -Item "Game" `
        -Label "Game Clients" `
        -Order 8 `
        -Info "Install Game Clients" `
        -Selected
    Get-InteractiveMultiMenuOption `
        -Item "Utile" `
        -Label "Utility Software" `
        -Order 9 `
        -Info "Install Utile Software" `
        -Selected
    Get-InteractiveMultiMenuOption `
        -Item "WSL" `
        -Label "Enable WSL" `
        -Order 10 `
        -Info "Enable WSL and Install Distributions" `
        -Selected
    Get-InteractiveMultiMenuOption `
        -Item "Ubuntu" `
        -Label "Install and Config Ubuntu" `
        -Order 11 `
        -Info "Config Ubuntu" `
        -Selected
    Get-InteractiveMultiMenuOption `
        -Item "Debian" `
        -Label "Install and Config Debian" `
        -Order 12 `
        -Info "Config Debian" `
        -Selected
    Get-InteractiveMultiMenuOption `
        -Item "Kali" `
        -Label "Install and Config KAli" `
        -Order 13 `
        -Info "Config Kali" `
        -Selected
    Get-InteractiveMultiMenuOption `
        -Item "Terminal" `
        -Label "config Terminal and Install Terminal Softwares" `
        -Order 14 `
        -Info "Config Terminal" `
        -Selected
    Get-InteractiveMultiMenuOption `
        -Item "IDE" `
        -Label "Install IDE and Database" `
        -Order 15 `
        -Info "Install IDE and Database Management" `
        -Selected
    Get-InteractiveMultiMenuOption `
        -Item "Graphic" `
        -Label "Install Graphic and Video Sofwares" `
        -Order 16 `
        -Info "Install Graphic / Design Software" `
        -Selected
    Get-InteractiveMultiMenuOption `
        -Item "Decentralize" `
        -Label "Install Web3 and Decentralize Software" `
        -Order 17 `
        -Info "Install Web3 / Decentralize Software" `
        -Selected
    Get-InteractiveMultiMenuOption `
        -Item "Devices" `
        -Label "Install Device Client Software" `
        -Order 18 `
        -Info "Install Device Manager Software" `
        -Selected
    Get-InteractiveMultiMenuOption `
        -Item "AfterInstallation" `
        -Label "Update and Upgrade" `
        -Order 19 `
        -Info "Update and Upgrade Windows and Reboot" `
        -Selected
)

# Define the header of the menu
$SelectedScriptsTitle = @"
    Welcome To PCC(R3C4) Script
    It Helps you to install and configure your Windows
    Please Select The Script You Want To Run
    Press Enter to run the selected scripts
"@


$SelectedScripts = Get-InteractiveMenuUserSelection -Header $SelectedScriptsTitle -Items $ScriptsItems # -Options $options


# Set Variable

# $Path = Get-Location;
# $ScriptPath = $Path + "\scripts\";
# $ScriptFullPath = $ScriptPath + $ScriptName;
$BaseUrl = "https://raw.githubusercontent.com/R3C4/WindowsConfig/main/"


# Run Selected VPN
# (Invoke-WebRequest $BaseUrl + $SelectedVPN + ".ps1")
Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command (Invoke-Expression -Command (Invoke-WebRequest $BaseUrl+ "scripts/" + $SelectedVPN + ".ps1")) " -Verb RunAs ;

# Run Selected Scripts
Function ScriptRunner ( $ScriptName ){
    Invoke-Expression -Command ( Invoke-WebRequest $ScriptName )
}

foreach( $ScriptName in $SelectedScripts){
    $ScriptName = $BaseUrl + "scripts/" +$ScriptName + ".ps1";
    ScriptRunner $ScriptName;
}




