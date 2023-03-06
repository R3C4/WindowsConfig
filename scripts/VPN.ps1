
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
# Invoke-WebRequest -Uri  -OutFile 
# Start-Process -Filepath "" -ArgumentList "/S" -Wait 

# 【Clashs for windows】
# https://github.com/Fndroid/clash_for_windows_pkg/releases

# GitDownloader -UserRepo "Fndroid/clash_for_windows_pkg" -Type "" -Install "" -PathtoExtract "C:\Program Files\VPN"
# 【Clash模板】
# https://github.com/Hackl0us/SS-Rule-Snippet/blob/master/LAZY_RULES/clash.yaml

# GitDownloader -UserRepo "" -Type "" -Install "" -PathtoExtract "C:\Program Files\VPN"
# 【Clash汉化】
# https://github.com/ender-zhao/Clash-for-Windows_Chinese/releases

# GitDownloader -UserRepo "" -Type "" -Install "" -PathtoExtract "C:\Program Files\VPN"
# 【Clash.Net】
# https://github.com/ClashDotNetFramework/ClashDotNetFramework/releases

# GitDownloader -UserRepo "" -Type "" -Install "" -PathtoExtract "C:\Program Files\VPN"
# 【Clash.Mini】
# https://github.com/Clash-Mini/Clash.Mini/releases

# GitDownloader -UserRepo "" -Type "" -Install "" -PathtoExtract "C:\Program Files\VPN"
# 【V2rayN 】
# https://github.com/2dust/v2rayN/releases

# GitDownloader -UserRepo "" -Type "" -Install "" -PathtoExtract "C:\Program Files\VPN"
# 【V2Ray-Desktop】
# https://github.com/Dr-Incognito/V2Ray-Desktop/releases

# GitDownloader -UserRepo "" -Type "" -Install "" -PathtoExtract "C:\Program Files\VPN"
# 【Netch】
# https://github.com/NetchX/Netch/releases

# GitDownloader -UserRepo "" -Type "" -Install "" -PathtoExtract "C:\Program Files\VPN"
# 【shadowsocks（SS）】<既是一种协议也有同名软件>
# https://github.com/shadowsocks/shadowsocks-windows/releases

# GitDownloader -UserRepo "" -Type "" -Install "" -PathtoExtract "C:\Program Files\VPN"
# 【shadowsocksr（SSR） 】<既是一种协议也有同名软件>

# 1：https://github.com/shadowsocksrr/shadowsocksr-csharp/releases

# GitDownloader -UserRepo "" -Type "" -Install "" -PathtoExtract "C:\Program Files\VPN"
# 2：https://github.com/HMBSbige/ShadowsocksR-Windows/releases

# GitDownloader -UserRepo "" -Type "" -Install "" -PathtoExtract "C:\Program Files\VPN"
# 【Trojan】
# https://github.com/trojan-gfw/trojan/releases

# GitDownloader -UserRepo "" -Type "" -Install "" -PathtoExtract "C:\Program Files\VPN"
# 【Trojan-QT5】
# https://github.com/McDull-GitHub/trojan-qt5/releases

# GitDownloader -UserRepo "" -Type "" -Install "" -PathtoExtract "C:\Program Files\VPN"
# 【Trojan-client-slim】
# https://github.com/KevinZonda/trojan-client-slim/releases

# GitDownloader -UserRepo "" -Type "" -Install "" -PathtoExtract "C:\Program Files\VPN"
# 【igniter】
# https://github.com/trojan-gfw/igniter/releases

# GitDownloader -UserRepo "" -Type "" -Install "" -PathtoExtract "C:\Program Files\VPN"
# 【Qv2ray】
# https://github.com/Qv2ray/Qv2ray/releases

# GitDownloader -UserRepo "" -Type "" -Install "" -PathtoExtract "C:\Program Files\VPN"
# 【xray】
# https://github.com/XTLS/Xray-core/releases/tag/v1.2.4

# GitDownloader -UserRepo "" -Type "" -Install "" -PathtoExtract "C:\Program Files\VPN"
# 【winXray】
# https://www.winxray.com/

# GitDownloader -UserRepo "" -Type "" -Install "" -PathtoExtract "C:\Program Files\VPN"
# 【SSCap】
# https://github.com/Windyronnie/SSCap-v4.0

# GitDownloader -UserRepo "" -Type "" -Install "" -PathtoExtract "C:\Program Files\VPN"
# https://sourceforge.net/projects/sscap/files/?source=navbar

# GitDownloader -UserRepo "" -Type "" -Install "" -PathtoExtract "C:\Program Files\VPN"
# 【SStap】<sstap、Proxifier、tun2socks  可以通过虚拟网卡的方式强制接管所有流量>（可以搜索TUN/TAP工具强制接管指定程序的网络流量走虚拟网卡，通过SS代理转发流量）

# https://github.com/FQrabbit/SSTap-Rule/releases/tag/SSTap%E5%B8%B8%E7%94%A8%E7%89%88%E6%9C%AC%E5%8F%8A%E5%8E%BB%E5%B9%BF%E5%91%8A

# GitDownloader -UserRepo "" -Type "" -Install "" -PathtoExtract "C:\Program Files\VPN"
# 【SStap规则】
# https://github.com/FQrabbit/SSTap-Rule

# GitDownloader -UserRepo "" -Type "" -Install "" -PathtoExtract "C:\Program Files\VPN"
# 【BifrostV】
# https://github.com/v2raym/bifrostv/blob/master/BifrostV_v0.6.8.apk

# GitDownloader -UserRepo "" -Type "" -Install "" -PathtoExtract "C:\Program Files\VPN"
# 【Stairspeedtest】
# https://github.com/tindy2013/stairspeedtest-reborn/releases

# GitDownloader -UserRepo "" -Type "" -Install "" -PathtoExtract "C:\Program Files\VPN"