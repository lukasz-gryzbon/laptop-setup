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
brew install git
brew install git-extras
brew install legit
brew install git-flow
brew install git-crypt

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
brew install curl
brew install wget
brew install vim
brew install openssl
brew install coreutils
brew install moreutils
brew install maven
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
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

echo "Installing homebrew cask"
# This may be required ? brew install --cask caskroom/cask/brew-cask

brew install --cask font-fira-code font-jetbrains-mono

echo "Cleaning up brew"
brew cleanup

#echo "Grunting it up"
#npm install -g grunt-cli

#Install Zsh & Oh My Zsh
echo "Installing Oh My ZSH..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Setting up Zsh plugins..."
#cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
git clone https://github.com/nojhan/liquidprompt.git $ZSH_CUSTOM/plugins/liquidprompt

echo "Setting ZSH as shell..."
chsh -s /bin/zsh

echo "source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh" >> ~/.zshrc
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
echo "plugins=(git docker docker-compose zsh-autosuggestions zsh-syntax-highlighting zsh-completions fast-syntax-highlighting zsh-autocomplete liquidprompt)" >> ~/.zshrc

#Aliases
echo "alias lzd='lazydocker'" >> ~/.zshrc
#echo "alias colima='colima start --cpu 4 --memory 20 --disk 50'" >> ~/.zshrc

#Set up iTerm2's option+arrows left&right to work as expected
echo "# Mine" >> ~/.zshrc
echo "bindkey -e" >> ~/.zshrc
echo "bindkey '\e\e[C' forward-word" >> ~/.zshrc
echo "bindkey '\e\e[D' backward-word" >> ~/.zshrc

echo "set rtp+=/opt/homebrew/opt/fzf" >> ~/.vimrc

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
cloudmounter
privadovpn
balenaetcher
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
