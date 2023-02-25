
# Install Geph VPN

Invoke-WebRequest -Uri "https://f001.backblazeb2.com/file/geph4-dl/geph-releases/windows-stable/4.7.7/geph-windows-setup.exe" -OutFile 'geph.exe'
Start-Process -Filepath "geph.exe" -ArgumentList "/S" -Wait 

function StartGeph {
    Set-Variable -Name GephUsername -Visibility Public -Scope Global -Force -Option AllScope
    Set-Variable -Name GephPassword -Visibility Public -Scope Global -Force -Option AllScope
    Set-Variable -Name GephPath -Visibility Public -Scope Global -Force -Option AllScope
    $GephUsername = Read-Host -Prompt "Enter your Geph Username"
    $GephPassword = Read-Host -Prompt "Enter your Geph Password"
    $Gephmode = Read-Host -Prompt "Enter your Geph Mode VPN(windivert) Or Proxy(nothing)"
    $Geph = "C:\Program Files (x86)\Geph\geph4-client.exe"
    Start-Process -FilePath $Geph -ArgumentList "connect --username $GephUsername --password $GephPassword --vpn-mode $GephMode" -Wait  -Verb RunAs -WindowStyle Hidden    
    
}

function StopGeph {
    $Geph = "C:\Program Files (x86)\Geph\geph4-client.exe"
    Start-Process -FilePath $Geph -ArgumentList "disconnect" -Wait  -Verb RunAs -WindowStyle Hidden 
}

function RestartGeph {
    StopGeph
    StartGeph
}

StartGeph

