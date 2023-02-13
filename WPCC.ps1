
Disable-UAC

Set-ExecutionPolicy Bypass -Scope CurrentUser -Force;


# Before Start
Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `"cd C:\Users\Wiztox\Desktop\WPCC\scripts\ ; .\BeforeStart.ps1`" " -Verb RunAs ;
# DNS
Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `"cd C:\Users\Wiztox\Desktop\WPCC\scripts\ ; .\DNS.ps1`" " -Verb RunAs ;
# Runtime / Language
Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `"cd C:\Users\Wiztox\Desktop\WPCC\scripts\ ; .\RuntimeLanguage.ps1`" " -Verb RunAs ;
# VPN
Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `"cd C:\Users\Wiztox\Desktop\WPCC\scripts\ ; .\VPN.ps1`" " -Verb RunAs ;
# Windows Features
Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `"cd C:\Users\Wiztox\Desktop\WPCC\scripts\ ; .\WindowsFeatures.ps1`" " -Verb RunAs ;
# Social
Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `"cd C:\Users\Wiztox\Desktop\WPCC\scripts\ ; .\Social.ps1`" " -Verb RunAs ;
# Browser
Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `"cd C:\Users\Wiztox\Desktop\WPCC\scripts\ ; .\Browser.ps1`" " -Verb RunAs ;
# Game
Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `"cd C:\Users\Wiztox\Desktop\WPCC\scripts\ ; .\Game.ps1`" " -Verb RunAs ;
# Utils
Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `"cd C:\Users\Wiztox\Desktop\WPCC\scripts\ ; .\Utile.ps1`" " -Verb RunAs ;
# WSL
Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `"cd C:\Users\Wiztox\Desktop\WPCC\scripts\ ; .\WSL.ps1`" " -Verb RunAs ;
# Ubuntu     
Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `"cd C:\Users\Wiztox\Desktop\WPCC\scripts\ ; .\Ubuntu.ps1`" " -Verb RunAs ;
# Debian
Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `"cd C:\Users\Wiztox\Desktop\WPCC\scripts\ ; .\Debian.ps1`" " -Verb RunAs ;
# Kali
Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `"cd C:\Users\Wiztox\Desktop\WPCC\scripts\ ; .\Kali.ps1`" " -Verb RunAs ;
# Terminal
Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `"cd C:\Users\Wiztox\Desktop\WPCC\scripts\ ; .\Terminal.ps1`" " -Verb RunAs ;
# Programming Tools
Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `"cd C:\Users\Wiztox\Desktop\WPCC\scripts\ ; .\IDE.ps1`" " -Verb RunAs ;
# Graphic / Design
Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `"cd C:\Users\Wiztox\Desktop\WPCC\scripts\ ; .\Graphic.ps1`" " -Verb RunAs ;
# Decentralize
Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `"cd C:\Users\Wiztox\Desktop\WPCC\scripts\ ; .\Decentralize.ps1`" " -Verb RunAs ;
# Other Devices
Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `"cd C:\Users\Wiztox\Desktop\WPCC\scripts\ ; .\Devices.ps1`" " -Verb RunAs ;
# After Installations
Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `"cd C:\Users\Wiztox\Desktop\WPCC\scripts\ ; .\AfterInstallation.ps1`" " -Verb RunAs ;