

function StartWindscribe {
    Set-Variable -Name WindscribeUsername -Visibility Public -Scope Global -Force -Option AllScope
    Set-Variable -Name WindscribePassword -Visibility Public -Scope Global -Force -Option AllScope
    Set-Variable -Name WindscribePath -Visibility Public -Scope Global -Force -Option AllScope
    $WindscribeUsername = Read-Host -Prompt "Enter your Windscribe Username"
    $WindscribePassword = Read-Host -Prompt "Enter your Windscribe Password"
    $Windscribemode = Read-Host -Prompt "Enter your Windscribe Mode VPN(windivert) Or Proxy(nothing)"
    $Windscribe = "C:\Program Files\Windscribe\windscribe-cli.exe"
    Start-Process -FilePath $Windscribe -ArgumentList "connect --username $WindscribeUsername --password $WindscribePassword --vpn-mode $WindscribeMode" -Wait # -Verb RunAs -WindowStyle Hidden    
    
}

function StopWindscribe {
    param (
        
    )
    
}

function RestartWindscribe {
    param (
        
    )
    
}