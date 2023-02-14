using module InteractiveMenu 
Install-Module -Name InteractiveMenu
Import-Module InteractiveMenu

# Disable-UAC

Set-ExecutionPolicy Bypass -Scope CurrentUser -Force;



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
    [InteractiveMultiMenuItem]::new("BeforeStart", "Before Start", $true, 0, $false, "Activate windows")
    [InteractiveMultiMenuItem]::new("PackageManager", "Package Manger", $true, 1, $false, "Install Winget , Chochlatey , Scoop , NuGet and Upgrade Windows")
    [InteractiveMultiMenuItem]::new("DNS", "DNS / DDNS", $true, 1, $false, "Setup ControlD and DDNS")
    [InteractiveMultiMenuItem]::new("RuntimeLanguage", "Runtime / Language", $true, 2, $false, "Install Runtimes and Programming Languages")
    [InteractiveMultiMenuItem]::new("VPN", "VPN", $true, 3, $false, "Install VPN Software and Protocol")
    [InteractiveMultiMenuItem]::new("WindowsFeatures", "Enable Windows Features", $true, 4, $false, "")
    [InteractiveMultiMenuItem]::new("Social", "Social Media", $true, 5, $false, "Install Social Media")
    [InteractiveMultiMenuItem]::new("Browser", "Browser", $true, 6, $false, "Install Browser")
    [InteractiveMultiMenuItem]::new("Game", "Game Clients", $true, 7, $false, "Install Game Clients")
    [InteractiveMultiMenuItem]::new("Utile", "Utility Software", $true, 8, $false, "Install Utile Software")
    [InteractiveMultiMenuItem]::new("WSL", "Enable WSL", $true, 9, $false, "Enable WSL and Install Distributions")
    [InteractiveMultiMenuItem]::new("Ubuntu", "Install and Config Ubuntu", $true, 10, $false, "Config Ubuntu")
    [InteractiveMultiMenuItem]::new("Debian", "Install and Config Debian", $true, 11, $false, "Config Debian")
    [InteractiveMultiMenuItem]::new("Kali", "Install and Config KAli", $true, 12, $false, "Config Kali")
    [InteractiveMultiMenuItem]::new("Terminal", "config Terminal and Install Terminal Softwares", $true, 13, $false, "Config Terminal")
    [InteractiveMultiMenuItem]::new("IDE", "Install IDE and Database", $true, 14, $false, "Install IDE and Database Management")
    [InteractiveMultiMenuItem]::new("Graphic", "Install Graphic and Video Sofwares", $true, 15, $false, "Install Graphic / Design Software")
    [InteractiveMultiMenuItem]::new("Decentralize", "Install Web3 and Decentralize Software", $true, 16, $false, "Install Web3 / Decentralize Software")
    [InteractiveMultiMenuItem]::new("Devices", "Install Device Client Software", $true, 17, $false, "Install Device Manager Software")
    [InteractiveMultiMenuItem]::new("AfterInstallation", "Update and Upgrade", $true, 18, $false, "Update and Upgrade Windows and Reboot")
)



# Define the header of the menu
$header = @"
    Welcome To PCC(R3C4) Script
    It Helps you to install and configure your Windows
    Please Select The Script You Want To Run
    Press Enter to run the selected scripts
"@
# Instantiate new menu object
$menu = [InteractiveMultiMenu]::new($header, $menuItems);

$options = @{
    HeaderColor = [ConsoleColor]::DarkGreen;
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
$menu.SetOptions($options)

$selectedItems = $menu.GetSelections()

Function ScriptRunner ( $ScriptName ){
    Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `" Invoke-RestMethod $ScriptName | Invoke-RestMethod  `" " -Verb RunAs ;
}

foreach( $ScriptName in $selectedItems){
    $ScriptName = $BaseUrl + $ScriptName + ".ps1";
    ScriptRunner $ScriptName;
}