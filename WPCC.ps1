
Disable-UAC

Set-ExecutionPolicy Bypass -Scope CurrentUser -Force;

Import-Module InteractiveMenu
Install-Module -Name InteractiveMenu -Force

$Path = Get-Location;
$ScriptPath = $Path + "\scripts\";
$BaseUrl = "https://pcc.com/"

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

$menuItems = @(
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

$options = @{
    HeaderColor = [ConsoleColor]::DarkYellow;
    HelpColor = [ConsoleColor]::Cyan;
    CurrentItemColor = [ConsoleColor]::DarkGreen;
    LinkColor = [ConsoleColor]::DarkCyan;
    CurrentItemLinkColor = [ConsoleColor]::Black;
    MenuDeselected = "[ ]";
    MenuSelected = "[x]";
    MenuCannotSelect = "[/]";
    MenuCannotDeselect = "[!]";
    MenuInfoColor = [ConsoleColor]::DarkYellow;
    MenuErrorColor = [ConsoleColor]::DarkRed;
}

# Define the header of the menu
$header = @"
    Welcome To PCC(R3C4) Script
    It Helps you to install and configure your Windows
    Please Select The Script You Want To Run
    Press Enter to run the selected scripts
"@


$selectedItems = Get-InteractiveMenuUserSelection -Header $header -Items $menuItems -Options $options

Function ScriptRunner ( $ScriptName ){
    Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `" Invoke-RestMethod $ScriptName | Invoke-RestMethod  `" " -Verb RunAs ;
}

# foreach( $ScriptName in $selectedItems){
#     $ScriptName = $BaseUrl + $ScriptName + ".ps1";
#     ScriptRunner $ScriptName;
# }