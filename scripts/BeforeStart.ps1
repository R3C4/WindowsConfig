
## Updates Powershell to Latest Release
Invoke-Expression "& { $(Invoke-Restmethod https://aka.ms/Install-PowerShell.ps1) } -UseMSI"

# Check for winget and install
Write-Host "`nInstalling winget - " -ForegroundColor Yellow -NoNewline; Write-Host "[1-10]" -ForegroundColor Green -BackgroundColor Black
$hasPackageManager = Get-AppPackage -name "Microsoft.DesktopAppInstaller"
$hasWingetexe = Test-Path "C:\Users\$env:Username\AppData\Local\Microsoft\WindowsApps\winget.exe"
if (!$hasPackageManager -or !$hasWingetexe) {
    $releases_url = "https://api.github.com/repos/microsoft/winget-cli/releases/latest"
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $releases = Invoke-RestMethod -uri "$($releases_url)"
    $latestRelease = $releases.assets | Where-Object { $_.browser_download_url.EndsWith("msixbundle") } | Select-Object -First 1
    Add-AppxPackage -Path $latestRelease.browser_download_url
}

# Install PS7 
Write-Host "`nInstalling Powershell 7 - " -ForegroundColor Yellow -NoNewline; Write-Host "[2-10]" -ForegroundColor Green -BackgroundColor Black
If (!(Test-Path "C:\Program Files\PowerShell\7\pwsh.exe")) {
    winget install --id Microsoft.Powershell --source winget --accept-package-agreements --accept-source-agreements
}
else {
    continue
}

Install-Module -Name Terminal-Icons -Repository PSGallery


# Activate

Invoke-RestMethod https://massgrave.dev/get | Invoke-Expression -Wait

# Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `" `"" -Verb RunAs
winget settings --enable InstallerHashOverride

# Upgrade Windows 
Start-Process powershell "-ExecutionPolicy RemoteSigned -NoProfile -NoExit -Command `"Install-Module PSWindowsUpdate -AllowClobber -AcceptAll ;Import-Module PSWindowsUpdate ;Get-WindowsUpdate ;Install-WindowsUpdate -AcceptAll ;`"" -Verb RunAs

# Upgrade Windows store apps 
winget upgrade --all --force --ignore-security-hash


function GitDownloader(
        [string] $UserRepo  ,
        [bool] $Install = $false ,
        [string] $Type ,
        [bool] $Batch = $false ,
        [string] $PathtoExtract = $PWD ) {
    $RepoSplitted = $UserRepo.Split("/")
    $User = $RepoSplitted[0]
    $Repo = $RepoSplitted[1]
    $filenamePattern = @{
        exe = "application/x-msdownload"
        zip = "application/zip"
    }
    $Headers = @{
        "Accept" = "application/vnd.github+json"
        "X-GitHub-Api-Version" = "2022-11-28"
    }

    $GitApi = "https://api.github.com/repos/$UserRepo/releases/latest"
    $GitApiResponse = Invoke-RestMethod -UserAgent "curl/7.72.0" -Method GET -Uri $GitApi -Headers $Headers
    $GitAssetss = $GitApiResponse.assets
    $GitFilter = $GitAssetss | Where-Object content_type -like ($filenamePattern[$Type])
    $GitDownloadUri = $GitFilter.browser_download_url
    if ($Type -eq "exe" ) {
        $OutFile = $Repo + ".exe"
        Invoke-WebRequest -Uri $GitDownloadUri -OutFile $OutFile
        Start-Process -Filepath $OutFile -ArgumentList "/S" -Wait
    } elseif ($Type -eq "zip" -and $Batch -eq $false) {

        $OutFile = $Repo + ".zip"
        Invoke-WebRequest -Uri $GitDownloadUri -OutFile $OutFile
        
        if ($Install -eq $true) {
            Expand-Archive -Path $OutFile -DestinationPath $PathtoExtract
            Start-Process -Filepath $OutFile -ArgumentList "/S" -Wait
        }else {
            Expand-Archive -Path $OutFile -DestinationPath $PathtoExtract
        }

    } elseif ($Type -eq "zip" -and $Batch -eq $true) {
        mkdir $Repo
        foreach ($item in $GitDownloadUri ) {
            $ParsedGitDownloadUri = $item.split("/") 
            $FullFileName = $ParsedGitDownloadUri -like "*.zip"
            $FileName = $FullFileName.split(".")[0]
            $OutFile = $FileName + ".zip"
            Invoke-WebRequest -Uri $item -OutFile $Repo\$OutFile
            Expand-Archive -Path $Repo\$OutFile -DestinationPath $PathtoExtract\$Repo
        }
    }
    
    else {
        Write-Error "Type not supported"
    }
}






