
# - Adobe
winget install -e --id Adobe.AdobeConnect --force --ignore-security-hash  


# - Figma
winget install -e --id Figma.fonthelper --force --ignore-security-hash  
winget install -e --id Figma.Figma --force --ignore-security-hash  

# - zeplin
choco install zeplin  --confirm --force --force-dependencies --acceptlicense  
