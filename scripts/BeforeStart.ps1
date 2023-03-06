
# Activate

Invoke-RestMethod https://massgrave.dev/get | Invoke-Expression -Wait

# Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `" `"" -Verb RunAs
winget settings --enable InstallerHashOverride

# Upgrade Windows 
Start-Process powershell "-ExecutionPolicy RemoteSigned -NoProfile -NoExit -Command `"Install-Module PSWindowsUpdate -AllowClobber -AcceptAll ;Import-Module PSWindowsUpdate ;Get-WindowsUpdate ;Install-WindowsUpdate -AcceptAll ;`"" -Verb RunAs

# Upgrade Windows store apps 
winget upgrade --all --force --ignore-security-hash


function GitDownloader(
    [string] $UserRepo ,
    [string] $Type ,
    [bool] $Install ,
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
    } elseif ($Type -eq "zip" ) {

        $OutFile = $Repo + ".zip"
        Invoke-WebRequest -Uri $GitDownloadUri -OutFile $OutFile
        
        if ($Install -eq $true) {
            Expand-Archive -Path $OutFile -DestinationPath $PathtoExtract
            Start-Process -Filepath $OutFile -ArgumentList "/S" -Wait
        }else {
            Expand-Archive -Path $OutFile -DestinationPath $PathtoExtract
        }

    } else {
        Write-Error "Type not supported"
    }
}