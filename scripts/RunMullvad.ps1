
#Install Mullvad VPN
winget install -e --id MullvadVPN.MullvadVPN --force --ignore-security-hash 

$AccountNumber = Read-Host -Prompt 'Enter your Mullvad Account Number';
$PuttyPath = "C:\Program Files\PuTTY\putty.exe";



mullvad account login $AccountNumber


# Setup Split Tunneling

mullvad split-tunnel set on

mullvad split-tunnel app add $PuttyPath


# Get Mullvad Bridges

# Make Function that Return Object with Mullvad Bridges

function Get-MullvadBridges {
    
    $MullvadServersApi = "https://api-www.mullvad.net/www/relays/all/" ;
    $MullvadServersJSON = (Invoke-WebRequest -Uri $MullvadServersApi).Content  ;
    $MullvadServersCompelete = $MullvadServersJSON | ConvertFrom-Json ;
    $MullvadServersActive = $MullvadServersCompelete | Where-Object { $_.active -eq "True" } ;
    $MullvadServersBridges = $MullvadServersActive | Where-Object { $_.type -eq "bridge" } ;
    $MullvadServersBridgesPort10G = $MullvadServersBridges | Where-Object { $_.network_port_speed -eq "10" };
    $V2rayBridges = $MullvadServersBridges | Where-Object { $_.ipv4_v2ray -ne $null };
    
    $Mullvad = {
        Servers = $MullvadServersCompelete ,
        Actives = $MullvadServersActive ,
        Bridges = $MullvadServersBridges ,
        Bridges10G = $MullvadServersBridgesPort10G ,
        V2ray = $V2rayBridges 
    }

    return $Mullvad 
}





$Random10GSSHBridge = $MullvadServersBridgesPort10G | Get-Random;
$RandomSSHBridge = $MullvadServersBridges | Get-Random;
$RandomV2rayBridge = $V2rayBridges | Get-Random;

# Setup V2ray





# Setup SSH
Invoke-WebRequest -UserAgent "Wget"  -Uri "https://drive.proton.me/urls/J054GR08PW#B7WHlS9ECmExhttps://www.fosshub.com/KiTTY.html?dwl=kitty-0.76.1.3.exe" -OutFile 'kitty.exe'
Start-Process -Filepath "kitty.exe" -ArgumentList "/S" -Wait 


# Start-Job -Name "Mullvad Bridge" -ScriptBlock {ssh -f -N -D 1234 mullvad@193.138.218.71 1234} -ArgumentList @("mullvad")
# $MullvadSSHPID = "Get-Process ssh | select -expand id"



# Setup Bridge and Connect

function Set-MullvadBridge {
    param (
        [Parameter(Mandatory=$true)]
        [Int32]$LocalPort = 1234 ,
        [Parameter(Mandatory=$true)]
        [string]$BridgeType,
        [Parameter(Mandatory=$true)]
        [string]$BridgeIP = $RandomSSHBridge ,
        [Parameter(Mandatory=$true)]
        [Int32]$BridgePort = 22 
    )
    # $BridgeIP = @(
    #     $Random10GSSHBridge,
    #     $RandomSSHBridge,
    #     $RandomV2rayBridge
    # )


    # $BridgeIP = Read-Host -Prompt "Enter the Bridge IP Group you want to use: 1) 10G SSH 2) SSH 3) V2ray";


    mullvad bridge set custom local $LocalPort $BridgeIP $BridgePort
    mullvad relay set tunnel-protocol openvpn
    mullvad bridge set state on
    mullvad relay set location usa
    mullvad connect
}

Set-MullvadBridge




