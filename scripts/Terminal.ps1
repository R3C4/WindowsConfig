


# Install Windows Terminal
Write-Host "`nInstalling Windows Terminal - " -ForegroundColor Yellow -NoNewline ; Write-Host "[3-10]" -ForegroundColor Green -BackgroundColor Black
$hasWindowsTerminal = Get-AppPackage -Name "Microsoft.WindowsTerminal"
try {
    if (!$env:WT_SESSION -eq $true -or !$hasWindowsTerminal) {
        winget install --id=Microsoft.WindowsTerminal -e --accept-package-agreements --accept-source-agreements
    }
}
catch { Write-Warning $_ }

# Install nerd fonts for Windows Terminal
GitDownloader -UserRepo "ryanoasis/nerd-fonts" -Type "zip" -Install $false -Batch $true

cd .\nerd-fonts\

$fonts = (New-Object -ComObject Shell.Application).Namespace(0x14)
foreach ($file in gci *.ttf)
{
    $fileName = $file.Name
    if (-not(Test-Path -Path "C:\Windows\fonts\$fileName" )) {
        echo $fileName
        dir $file | %{ $fonts.CopyHere($_.fullname) }
    }
}
cp *.ttf c:\windows\fonts\

$fonts = (New-Object -ComObject Shell.Application).Namespace(0x14)
foreach ($file in gci *.otf)
{
    $fileName = $file.Name
    if (-not(Test-Path -Path "C:\Windows\fonts\$fileName" )) {
        echo $fileName
        dir $file | %{ $fonts.CopyHere($_.fullname) }
    }
}
cp *.otf c:\windows\fonts\

cd ..


# Set PSGallery as trusted
Write-Host "`nSetting PSGallery as trusted repo - " -ForegroundColor Yellow -NoNewline ; Write-Host "[6-10]" -ForegroundColor Green -BackgroundColor Black
Install-PackageProvider -Name NuGet -Force | Out-Null
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted

winget install oh-my-posh
winget install XP8K0HKJFRXGCK
$OMPdest = "C:\Users\$env:Username\AppData\Local\Programs\oh-my-posh\themes"
Invoke-WebRequest -Uri $BaseUrl\Terminal\theme.omp.json -OutFile theme.omp.json
oh-my-posh --init --shell pwsh --config theme.omp.json
Move-Item -Path theme.omp.json -Destination $OMPdest

# Install ps modules in PS7
Write-Host "`nInstalling Z,PsReadLine,Terminal-Icons modules - "  -ForegroundColor Yellow -NoNewline ; Write-Host "[9-10]" -ForegroundColor Green -BackgroundColor Black

if ($PSVersionTable.PSVersion.Major -eq 7) {
    try {
        Start-Job -ScriptBlock {
            Install-Module -Name z -RequiredVersion 1.1.3 -Force -Scope CurrentUser -AllowClobber -confirm:$false
            Install-Module -Name Terminal-Icons -RequiredVersion 0.8.0 -Force -Scope CurrentUser -confirm:$false
            Install-Module -Name PSReadLine -RequiredVersion 2.2.6 -Force -AllowPrerelease -Scope CurrentUser -SkipPublisherCheck
        } | Wait-Job | Receive-Job
    }
    catch { Write-Warning $_ }
}
else {
    try {
        Start-Job -ScriptBlock {
            Start-Process "C:\Program Files\PowerShell\7\pwsh.exe" -ArgumentList { -Command Install-Module -Name z -RequiredVersion 1.1.3 -Force -Scope CurrentUser -AllowClobber -confirm:$false } -NoNewWindow
            Start-Process "C:\Program Files\PowerShell\7\pwsh.exe" -ArgumentList { -Command Install-Module -Name Terminal-Icons -RequiredVersion 0.8.0 -Force -Scope CurrentUser -confirm:$false } -NoNewWindow
            Start-Process "C:\Program Files\PowerShell\7\pwsh.exe" -ArgumentList { -Command Install-Module -Name PSReadLine -RequiredVersion 2.2.6 -Force -AllowPrerelease -Scope CurrentUser -SkipPublisherCheck } -NoNewWindow
        } | Wait-Job | Receive-Job
    }
    catch { Write-Warning $_ }
}


# Wrap up time for PS7 module install jobs
[int]$time = 30
$length = $time / 100
for ($time; $time -gt 0; $time--) {
    $min = [int](([string]($time / 60)).split('.')[0])
    $text = " " + $min + " minutes " + ($time % 60) + " seconds left."
    Write-Progress -Activity "Finishing up PS7 module installs in background job" -Status $text -PercentComplete ($time / $length)
    Start-Sleep 1
}


$terminaldest = "C:\Users\$env:Username\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\"
Invoke-WebRequest -Uri $BaseUrl\Terminal\settings.json -OutFile settings.json
Move-Item -Path settings.json -Destination $terminaldest



Invoke-WebRequest -Uri "https://github.com/chrisant996/clink/releases/download/v1.4.22/clink.1.4.22.33f515_setup.exe" -OutFile clink.1.4.22.33f515_setup.exe
Start-Process -FilePath clink.1.4.22.33f515_setup.exe -ArgumentList "/S" -Wait



# Install & Config LSD
scoop install lsd


Import-Module -Name Terminal-Icons
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView

# Install & Config Winfetch
Install-Script winfetch

# get & execute https://raw.githubusercontent.com/lptstr/winfetch/master/winfetch.ps1
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/lptstr/winfetch/master/winfetch.ps1" -OutFile winfetch.ps1
.\winfetch.ps1




Install-Module -Name PSWriteColor

winget install --id Starship.Starship
# TODO: Add starship config
# TODO: Config LSD




scoop install neofetch


Install-Module posh-git
Install-Module oh-my-posh

# TODO: Config nvim Lazyvim kickstarter Primeagen
winget install Neovim.Neovim




