
# - Epic
winget install -e --id EpicGames.EpicGamesLauncher --force --ignore-security-hash  

# - Steam
winget install -e --id Valve.Steam --force --ignore-security-hash  

# - EA
winget install -e --id ElectronicArts.EADesktop --force --ignore-security-hash  

# - Ubisoft
winget install -e --id Ubisoft.Connect --force --ignore-security-hash  

# - Origin
Invoke-WebRequest -Uri "https://origin-a.akamaihd.net/Origin-Client-Download/origin/live/OriginThinSetup.exe" -OutFile 'origin.exe'
Start-Process -Filepath "origin.exe" -ArgumentList "/S" -Wait winget install --silent

# - Battlenet
Invoke-WebRequest -Uri "https://www.battle.net/download/getInstallerForGame?os=win&gameProgram=BATTLENET_APP&version=Live" -OutFile 'battlenet.exe'
Start-Process -Filepath "battlenet.exe" -ArgumentList "/S" -Wait winget install --silent

# - Bethesda
winget install -e --id Bethesda.Launcher --force --ignore-security-hash  

# - GOG GALAXY
winget install -e --id GOG.Galaxy --force --ignore-security-hash  

# - Amazon Gameing Platform
winget install -e --id Amazon.Games --force --ignore-security-hash  

# - Uplay

# - Rockstar Games Launcher
choco install rockstar-launcher  --confirm --force --force-dependencies --acceptlicense  


