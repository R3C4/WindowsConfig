
# - NodeJS
winget install -e --id OpenJS.NodeJS --force --ignore-security-hash  

# - Python
winget install -e --id Python.Python.3.11 --force --ignore-security-hash  

# - Go
winget install -e --id GoLang.Go.1.19 --force --ignore-security-hash  

# - Rust
winget install -e --id Rustlang.Rust.GNU --force --ignore-security-hash  
winget install -e --id Rustlang.Rustup --force --ignore-security-hash  
winget install -e --id Rustlang.Rust.MSVC --force --ignore-security-hash  

# .NET
winget install -e --id Microsoft.DotNet.Framework.DeveloperPack_4 --force --ignore-security-hash  
winget install -e --id Microsoft.DotNet.Runtime.7 --force --ignore-security-hash  
winget install -e --id Microsoft.DotNet.SDK.7 --force --ignore-security-hash  
winget install -e --id Microsoft.DotNet.DesktopRuntime.7 --force --ignore-security-hash  
winget install -e --id Microsoft.DirectX --force --ignore-security-hash  

# C++
winget install -e --id Microsoft.VCRedist.2015+.x64 --force --ignore-security-hash  



#JAVA
winget install -e --id Oracle.JavaRuntimeEnvironment --force --ignore-security-hash  
winget install -e --id Oracle.JDK.19 --force --ignore-security-hash  

# - Yarn
winget install -e --id Yarn.Yarn --force --ignore-security-hash  
# PNPM
iwr https://get.pnpm.io/install.ps1 -useb | iex


# Flutter 
choco install flutter --confirm --force --force-dependencies --acceptlicense  


# - Docker
winget install -e --id Docker.DockerDesktop --force --ignore-security-hash  

# - Git
winget install -e --id Git.Git --force --ignore-security-hash  
winget install -e --id Gitlab.Runner --force --ignore-security-hash  
winget install -e --id Gitlab.Gitter --force --ignore-security-hash  
winget install -e --id GitHub.cli --force --ignore-security-hash  
winget install -e --id GitHub.GitHubDesktop --force --ignore-security-hash  
winget install -e --id GitHub.GitLFS --force --ignore-security-hash  
winget install -e --id Axosoft.GitKraken --force --ignore-security-hash  
