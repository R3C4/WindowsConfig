

# add to every line in a WCCP.ps1 file that start with "winget" a "--force " at the end 


import os
import re

path = "C:\\Users\\Wiztox\\WebstormProjects\\WindowsConfig\\WPCC.ps1"

startOfLine = 'Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command `"'
endOfLine = '`"" -Verb RunAs'

with open(path, "r") as f:
    lines = f.readlines()

with open(path, "w") as f:
    for line in lines:
        if line.startswith('Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command`" choco'):
            line.replace('Start-Process powershell "-ExecutionPolicy Bypass -NoProfile -NoExit -Command`" ', ' ')
            # line.replace('`"" -Verb RunAs', ' ')
            # line = startOfLine + " " + line.rstrip() + endOfLine + " \n"
        f.write(line) 

