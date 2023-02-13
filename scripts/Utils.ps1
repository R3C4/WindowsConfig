
# - Download Manager
winget install -e --id Tonec.InternetDownloadManager --force --ignore-security-hash  
winget install -e --id qBittorrent.qBittorrent --force --ignore-security-hash  

# - Video Player
winget install -e --id VideoLAN.VLC --force --ignore-security-hash  
winget install -e --id Streamlink.Streamlink --force --ignore-security-hash  
winget install -e --id Daum.PotPlayer --force --ignore-security-hash  
winget install -e --id Dio.PureCodec --force --ignore-security-hash  

#     - 30nama
Invoke-WebRequest -Uri "https://github.com/Mr30nama/30nama/releases/download/v0.9.7/30nama-Setup-0.9.7.exe" -OutFile '30nama.exe'
Start-Process -Filepath "30nama.exe" -ArgumentList "/S" -Wait winget install --silent


#     - stereamio
Invoke-WebRequest -Uri "https://www.strem.io/download?four=4" -OutFile 'streamio.exe'
Start-Process -Filepath "streamio.exe" -ArgumentList "/S" -Wait winget install --silent

# AnyDesk
winget install -e --id AnyDeskSoftwareGmbH.AnyDesk --force --ignore-security-hash  

# Rufus Ventoy
winget install -e --id Rufus.Rufus --force --ignore-security-hash  


# - Music Player
winget install -e --id Spotify.Spotify --force --ignore-security-hash  
winget install -e --id Winamp.Winamp --force --ignore-security-hash  
winget install -e --id Deezer.Deezer --force --ignore-security-hash  
winget install -e --id nukeop.nuclear --force --ignore-security-hash  
winget install -e --id staniel359.muffon --force --ignore-security-hash  
winget install -e --id TIDALMusicAS.TIDAL --force --ignore-security-hash  

# - Zip
winget install -e --id Bandisoft.Bandizip --force --ignore-security-hash  
winget install -e --id 7zip.7zip --force --ignore-security-hash  
winget install -e --id RARLab.WinRAR --force --ignore-security-hash  

# - putty
winget install -e --id PuTTY.PuTTY --force --ignore-security-hash  

# - winscp
winget install -e --id WinSCP.WinSCP --force --ignore-security-hash  

# - speedtest 
winget install -e --id Ookla.Speedtest --force --ignore-security-hash  

# - vmware
winget install -e --id VMware.WorkstationPro --force --ignore-security-hash  

# - virtualbox
winget install -e --id Oracle.VirtualBox --force --ignore-security-hash  

# - anydesk
winget install -e --id AnyDeskSoftwareGmbH.AnyDesk --force --ignore-security-hash  

# - Mega 
winget install -e --id Mega.MEGASync --force --ignore-security-hash  

# - notion
winget install -e --id Notion.Notion --force --ignore-security-hash  
winget install -e --id NotionRepackaged.NotionEnhanced --force --ignore-security-hash  

# Obsidian
winget install -e --id Obsidian.Obsidian --force --ignore-security-hash  

# - solar putty

# - Terminal
winget install -e --id Microsoft.WindowsTerminal --force --ignore-security-hash  

# - Bitwarden
winget install -e --id Bitwarden.Bitwarden --force --ignore-security-hash  

# - winget UI
winget install -e --id SomePythonThings.WingetUIStore --force --ignore-security-hash  

# - Thunderbirad
winget install -e --id Mozilla.Thunderbird --force --ignore-security-hash  

# - Microsoft
winget install -e --id Microsoft.PowerToys --force --ignore-security-hash  
winget install -e --id Microsoft.PowerAppsCLI --force --ignore-security-hash  
winget install -e --id Microsoft.PCManager --force --ignore-security-hash  
winget install -e --id Microsoft.Sysinternals.ProcessExplorer --force --ignore-security-hash  
winget install -e --id Microsoft.Sysinternals.ProcessMonitor --force --ignore-security-hash  
winget install -e --id Microsoft.WindowsPCHealthCheck --force --ignore-security-hash  
winget install -e --id Microsoft.quicreach --force --ignore-security-hash  
winget install -e --id Microsoft.PIX --force --ignore-security-hash  


# Streams
winget install -e --id Streamlabs.Streamlabs --force --ignore-security-hash  
winget install -e --id Streamlabs.StreamlabsOBS --force --ignore-security-hash  
winget install -e --id Streamlink.Streamlink --force --ignore-security-hash  
winget install -e --id OBSProject.OBSStudio --force --ignore-security-hash  
