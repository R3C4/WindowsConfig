
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

