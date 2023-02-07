
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