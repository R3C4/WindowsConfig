# - Download Manager
winget install -e --id Tonec.InternetDownloadManager
winget install -e --id qBittorrent.qBittorrent

# - Video Player
winget install -e --id VideoLAN.VLC
winget install -e --id Streamlink.Streamlink
winget install -e --id Daum.PotPlayer
winget install -e --id Dio.PureCodec

#     - 30nama
Invoke-WebRequest -Uri "https://github.com/Mr30nama/30nama/releases/download/v0.9.7/30nama-Setup-0.9.7.exe" -OutFile '30nama.exe'
Start-Process -Filepath "30nama.exe" -ArgumentList "/S" -Wait winget install --silent


#     - stereamio
Invoke-WebRequest -Uri "https://www.strem.io/download?four=4" -OutFile 'streamio.exe'
Start-Process -Filepath "streamio.exe" -ArgumentList "/S" -Wait winget install --silent


# - Music Player
winget install -e --id Spotify.Spotify
winget install -e --id Winamp.Winamp
winget install -e --id Deezer.Deezer
winget install -e --id nukeop.nuclear
winget install -e --id staniel359.muffon
winget install -e --id TIDALMusicAS.TIDAL

# - Zip
winget install -e --id Bandisoft.Bandizip
winget install -e --id 7zip.7zip
winget install -e --id RARLab.WinRAR

# - putty
winget install -e --id PuTTY.PuTTY

# - winscp
winget install -e --id WinSCP.WinSCP

# - speedtest 
winget install -e --id Ookla.Speedtest

# - vmware
winget install -e --id VMware.WorkstationPro

# - virtualbox
winget install -e --id Oracle.VirtualBox

# - anydesk
winget install -e --id AnyDeskSoftwareGmbH.AnyDesk

# - Mega 
winget install -e --id Mega.MEGASync

# - notion
winget install -e --id Notion.Notion
winget install -e --id NotionRepackaged.NotionEnhanced

# Obsidian
winget install -e --id Obsidian.Obsidian

# - solar putty

# - Terminal
winget install -e --id Microsoft.WindowsTerminal

# - Bitwarden
winget install -e --id Bitwarden.Bitwarden

# - winget UI
winget install -e --id SomePythonThings.WingetUIStore

# - Thunderbirad
winget install -e --id Mozilla.Thunderbird

# - Microsoft
winget install -e --id Microsoft.PowerToys
winget install -e --id Microsoft.PowerAppsCLI
winget install -e --id Microsoft.PCManager
winget install -e --id Microsoft.Sysinternals.ProcessExplorer
winget install -e --id Microsoft.Sysinternals.ProcessMonitor
winget install -e --id Microsoft.WindowsPCHealthCheck
winget install -e --id Microsoft.quicreach
winget install -e --id Microsoft.PIX


# Streams
winget install -e --id Streamlabs.Streamlabs
winget install -e --id Streamlabs.StreamlabsOBS
winget install -e --id Streamlink.Streamlink
winget install -e --id OBSProject.OBSStudio
