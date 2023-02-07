
# - Epic
winget install -e --id EpicGames.EpicGamesLauncher

# - Steam
winget install -e --id Valve.Steam

# - EA
winget install -e --id ElectronicArts.EADesktop

# - Ubisoft
winget install -e --id Ubisoft.Connect

# - Origin
Invoke-WebRequest -Uri "https://origin-a.akamaihd.net/Origin-Client-Download/origin/live/OriginThinSetup.exe" -OutFile 'origin.exe'
Start-Process -Filepath "origin.exe" -ArgumentList "/S" -Wait winget install --silent

# - Battlenet
Invoke-WebRequest -Uri "https://www.battle.net/download/getInstallerForGame?os=win&gameProgram=BATTLENET_APP&version=Live" -OutFile 'battlenet.exe'
Start-Process -Filepath "battlenet.exe" -ArgumentList "/S" -Wait winget install --silent

# - Bethesda
winget install -e --id Bethesda.Launcher

# - GOG GALAXY
winget install -e --id GOG.Galaxy

# - Amazon Gameing Platform
winget install -e --id Amazon.Games

# - Uplay

# - Rockstar Games Launcher
choco install rockstar-launcher



