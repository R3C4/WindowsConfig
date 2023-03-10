




wsl --update

wsl --install -d Ubuntu
wsl --install -d Debian
wsl --install -d kali-linux

wsl --update


ubuntu -c "sudo apt update && sudo apt upgrade -y && "
debian -c "sudo apt update && sudo apt upgrade -y && "
kali-linux -c "sudo apt update && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt install -y kali-linux-everything && sudo apt autoremove -y && sudo apt autoclean -y && sudo apt clean -y"


ubuntu -c "sudo apt-get install zsh && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "
debian -c "sudo apt-get install zsh && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "
kali-linux -c "sudo apt-get install zsh && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "

# TODO: Config LSD
ubuntu -c "apt install lsd"
debian -c "apt install lsd"
kali-linux -c "apt install lsd"


ubuntu -c "sudo apt install neofetch"
debian -c "sudo apt-get install neofetch"
kali-linux -c "sudo apt-get install neofetch"


ubuntu -c "/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)""
debian -c "/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)""
kali-linux -c "/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)""

# TODO: Config Starship
ubuntu -c "brew install starship"
debian -c "brew install starship"
kali-linux -c "brew install starship"

# Todo: Config Neovim Lazyvim kickstarter Primeagen
ubuntu -c "sudo apt install neovim"
debian -c "sudo apt-get install neovim"
kali-linux -c "sudo apt-get install neovim"

ubuntu -c""
debian -c ""
kali-linux -c ""









winget install -e --id opticos.gwsl --force --ignore-security-hash  
