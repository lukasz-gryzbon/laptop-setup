echo "Installing xcode-stuff"
xcode-select --install

#echo "Creating an SSH key for you..."
#ssh-keygen -t rsa

#echo "Please add this public key to Github \n"
#read -p "Press [Enter] key after this..."

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

sudo chown -R $(whoami) /usr/local/share/zsh /usr/local/share/zsh/site-functions

# Update homebrew recipes
echo "Updating homebrew..."
brew update

echo "Installing Git..."
brew install git

echo "Git config"

read -p "Enter full name: " fullname
read -p "Enter your email address: " email

git config --global user.name "$fullname"
git config --global user.email $email

echo "Installing brew git utilities..."
brew install git-extras
brew install legit
brew install git-flow

echo "Installing other brew stuff..."
brew install tree
brew install wget
brew install gron
brew install jq
brew install colima
brew install docker
brew install docker-compose
brew install pyenv
brew install pyenv-virtualenv
brew install remotemobprogramming/brew/mob
brew install git-crypt
brew install curl
brew install wget
brew install git
brew install vim
brew install openssl
brew install coreutils
brew install moreutils
brew install findutils
brew install binutils
brew install rename
brew install gnu-sed
brew install gnu-tar
brew install gawk
brew install gnutls
brew install gnu-indent
brew install gnu-getopt
brew install tree
brew install htop
brew install pidof
brew install pstree
brew install grep
brew install rsync
brew install ssh-copy-id
brew install screen
brew install gmp
brew install nmap
brew install socat
brew install rlwrap
brew install dnstracer
brew install fzf
brew install gradle
brew install nvm
brew install watch
brew install lazydocker


echo "Installing homebrew cask"
# This may be required ? brew install --cask caskroom/cask/brew-cask

brew tap homebrew/cask-fonts
brew install --cask font-fira-code font-jetbrains-mono

echo "Cleaning up brew"
brew cleanup

#echo "Grunting it up"
#npm install -g grunt-cli

#Install Zsh & Oh My Zsh
echo "Installing Oh My ZSH..."
curl -L http://install.ohmyz.sh | sh

echo "Setting up Zsh plugins..."
cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions
git clone https://github.com/nojhan/liquidprompt.git

echo "alias lzd='lazydocker'" >> ~/.zshrc

echo "Setting ZSH as shell..."
chsh -s /bin/zsh

echo "source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh" >> .zshrc

# Apps
apps=(
alfred
firefox
iterm2
jetbrains-toolbox
sublime-text
whatsapp
signal
#offset-explorer
drawio
slack
google-chrome
zoom
microsoft-teams
jiggler
openvpn-connect
tunnelblick
docker
)

echo "installing apps with Cask..."
brew install --cask ${apps[@]}

Echo "Installing SDKMan for managing anything JVM"
curl -s "https://get.sdkman.io" | bash

echo "Installing Python"
brew install python3

#brew cask alfred link

brew cleanup cask
brew cleanup

killall Finder

#echo "Add the following entry to the /etc/hosts file:"
#echo "127.0.0.   kafka"
#read -p "Press [Enter] key after you've done it..."

echo "Install Java:"
echo "sdk install java 21.0.2-open"
sdk install java 21.0.2-open

echo "Copy the following files manually from the old laptop:"
echo "~/.ssh/id_rsa"
echo "~/.ssh/id_rsa.pub"

echo "Adjust the iTerm2 setup:"
echo ""

echo "Done!"
