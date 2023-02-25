

# Get Accounts Username Password
$VPNUsername = Read-Host -Prompt "Enter your TG VPN Username";
$VPNPassword = Read-Host -Prompt "Enter your TG VPN Pssword";
$ProxyUsername = Read-Host -Prompt "Enter your TG Proxy Username";
$ProxyUUID = Read-Host -Prompt "Enter your TG Proxy UUID";

# Proxy URL 
$TG = "https://torguard.net/"

V2ray
$V2rayProxyUrl = $TG + "/proxynetwork/vmess.php" ;
SS
$SSProxyUrl = $TG + "/proxynetwork/shadowsocks.php" ;
SSH
$SSHProxyUrl = $TG + "/proxynetwork/ssh.php" ;
Socks5
$Socks5ProxyUrl = $TG + "/proxynetwork/socks5.php" ;
HTTPS
$HTTPSProxyUrl = $TG + "/proxynetwork/ " ;


# VPN URL
Socks5
$Socks5VPNUrl = $TG + "/network/socks5/" ;
SSL
$SSLVPNUrl = $TG + "/network/ssl/" ;
VPN Network
$NetworkVPNUrl = $TG + "/network/" ;
AnyConnect
$AnyconnectVPNUrl = $TG + "/network/anyconnect/" ;
10G
$10GVPNUrl = $TG + "/tengignetwork.php" ;



