ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew doctor

# Make sure we’re using the latest Homebrew:
brew update

# Upgrade any already-installed formulae:
brew upgrade

# Add formulae that duplicate OS X software with updated versions:
brew tap homebrew/dupes

# Install all the things:
brew install zsh
brew install fasd # Fast directory switcher
brew install git
brew install gibo # quickly access github's git ignore templates
brew install less
brew install lesspipe # pre-processes various file formats so they can be paged via Less
brew install ctags
brew install stow
# brew install --HEAD https://raw.github.com/neovim/neovim/master/neovim.rb #TODO: Update once Neovim 1.0 released

# Install all the databases
brew install sqlite
brew install postgresql
brew install mysql
# brew install mongo

# Install Python
brew install python
brew install python3

# Install Casks:

brew install caskroom/cask/brew-cask
brew cask install adobe-reader
brew cask install atom
brew cask install bettertouchtool
brew cask install box-sync
brew cask install dropbox
brew cask install fantastical
brew cask install firefox
brew cask install flux
brew cask install google-chrome
brew cask install google-drive
# brew cask install google-earth
brew cask install iterm2
brew cask install skype
brew cask install virtualbox
brew cask install vlc
# brew cask install vagrant

# Remove outdated versions from the cellar cleanup
brew cask cleanup
