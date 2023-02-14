
#Install Mullvad VPN
winget install -e --id MullvadVPN.MullvadVPN --force --ignore-security-hash 

$AccountNumber = Read-Host -Prompt 'Enter your Mullvad Account Number';
$PuttyPath = "C:\Program Files\PuTTY\putty.exe";



mullvad account login $AccountNumber


# Setup Split Tunneling

mullvad split-tunnel set on

mullvad split-tunnel app add $PuttyPath


# Get Mullvad Bridges

$MullvadServersApi = "https://api-www.mullvad.net/www/relays/all/";
$MullvadServersJSON = (Invoke-WebRequest -Uri $MullvadServersApi).Content ;
$MullvadServersCompelete = $MullvadServersJSON | ConvertFrom-Json;
$MullvadServersActive = $MullvadServersCompelete | Where-Object { $_.active -eq "True" };
$MullvadServersBridges = $MullvadServersActive | Where-Object { $_.type -eq "bridge" };
$MullvadServersBridgesPort10G = $MullvadServersBridges | Where-Object { $_.network_port_speed -eq "10" };

$V2rayBridge = $MullvadServersBridges | Where-Object { $_.ipv4_v2ray -ne $null };
$Random10GSSHBridge = $MullvadServersBridgesPort10G | Get-Random;
$SSHBridge = $MullvadServersBridges | Get-Random;
$RandomV2rayBridge = $V2rayBridge | Get-Random;

# Setup V2ray



# Setup Putty











# Setup Bridge and Connect

mullvad bridge set custom local 1234 $Random10GSSHBridge.ipv4_addr_in

mullvad relay set tunnel-protocol openvpn

mullvad bridge set state on

mullvad relay set location

mullvad connect










