#My dotfiles.

Works on *nix, optimized for OS X.

Managed using [Stow](http://www.gnu.org/software/stow/), so you can pick and
choose which programs to install.


---
##Philosophy

Initially I tried entirely automating the entire install process, but quickly
found it wasn't worth the maintenance. Starting from scratch happens so rarely
for me that each time I was fiddling with the bootstrap scripts to work around
a random issue (often due to a new version of OSX).

Instead, it's simpler to install stuff by hand, and manage only the
configuration files (dotfiles) in this repo.


---
##Install steps on a clean OSX machine:

1. Install X-code command line tools:
    `xcode-select --install`

2. Pull git repo.
    - First, create ssh keys and add them to github (if a new computer):
        - `ssh-keygen -t rsa -C "kristenwidman@gmail.com"`
        - # start the ssh-agent in the background
        - `eval "$(ssh-agent -s)"`
        - `ssh-add ~/.ssh/id_rsa`
        - # copy ssh key to clipboard  `pbcopy < ~/.ssh/id_rsa.pub`
        - Add/paste new SSH key in github
    - `git clone git@github.com:kristenwidman/dotfiles.git ~/.dotfiles`

3. Install desired binaries using your favorite package manager.
  - If on OSX, install [Homebrew](http://brew.sh/)
        - `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
  - `brew bundle` [is deprecated](https://github.com/Homebrew/homebrew/issues/32952), so ignore the Homebrew
    commands listed in `~/.dotfiles/homebrew/Brewfile`
  - instead, run the brew_setup shell script
  - Make sure Stow gets installed, we'll use this later to symlink the dotfiles. (should be done by the setup file)

4. Install [Ruby Version Manager (RVM)](http://rvm.io/) 

5. Install Prezto (zsh config scripts):
    - Install [my fork](https://github.com/jeffwidman/prezto) because it includes a plugin for [Atom](http://atom.io):
    `git clone --recursive git@github.com:jeffwidman/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"`
    - The default prezto instructions say to symlink the default config files.
      *Don't do this*; instead use Stow to symlink your own config files.

6. Now start `stow`'ing the various dotfiles - detailed instructions below.

7. Make ZSH the default shell.  
 1. `$ $EDITOR /etc/shells`
 2. Append the path to zsh - Homebrew sticks it in `/usr/local/bin/zsh`
 3. Save and exit
 4. `$ chsh -s /usr/local/bin/zsh`

8. If using iTerm2, clone themes into a directory of your choice:
  1. Go to http://ethanschoonover.com/solarized
  2. Download latest version
  3. Unzip and doubleclick the Solarized Dark theme for ansi.terminal or iterm
  4. Select the theme in the Terminal.app preferences under Settings > Profiles. You can press default to have it default selected.
  5. Darken the background and lighten the foreground to get better contrast
  

---
##How to symlink a dotfile using `stow`

  - `$ stow PACKAGE_NAME` will symlink all the files inside of the
  package_name's folder into the user's home folder.
  - If you are on an OS with a different path, such as to the fonts folder,
   then specify the full path
  - More info:
      - http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html
      - http://taihen.org/managing-dotfiles-with-gnu-stow/
      - http://kianmeng.org/blog/2014/03/08/using-gnu-stow-to-manage-your-dotfiles/
  - Exceptions (settings that aren't stowable):
      - Python pip requirements file


---
##List of config files

 - Atom
 - bash
 - fonts - if you're not on OSX, you'll likely need to specify a different path when stowing
 - git
 - homebrew - not stowable
 - neovim
 - osx
 - python - not stowable.
 - ruby
 - screen
 - vim
 - vimify - `.inputrc` and `.editrc` make vim commands work in many interactive
    shells, for example the mysql and postgres shells
 - zsh - includes prezto config files


---
##Misc Notes:

For themes, check out the [Base16 template system](https://github.com/chriskempson/base16). It includes templates for
theming many different apps.

Colorschemes that I like:
 - monokai
 - solarized
 - railscasts

Fonts that I like:
 - Ubuntu Monospace including powerline fix
 - Adobe Source Code (look for powerline fix)


---
##TODO:

 - add https://github.com/skwp/dotfiles/blob/master/ctags/ctags to make ctags parse ruby and js better
 - how to use ctags http://scholarslab.org/research-and-development/code-spelunking-with-ctags-and-vim/

 - Improve my vimrc and nvimrc - vim plugins:
   - vim-markdown Markdown syntax highlighting for Vim
   - syntastic (pylint, pep8, pyflakes linters)
   - youcompleteme
   - tasklist
   - taglist (and ctags) (tagbar as alternative?)
   - nerdtree
   - powerline
   - minibuffexplorer
   - the_silver_searcher (vs ctrlp?)

 - add ipython (replaces python interpreter)

 - add powerline - used in vim, [zsh](http://powerline.readthedocs.org/en/latest/usage/shell-prompts.html), ipython, and tmux

 - gitignore add:
    - https://github.com/github/gitignore/blob/master/Global/Vagrant.gitignore
    - https://github.com/github/gitignore/blob/master/Global/VirtualEnv.gitignore
    - https://github.com/github/gitignore/blob/master/Global/vim.gitignore


---
## Thanks

- [@dave-tucker](https://github.com/davetucker/dotfiles) - Initial inspiration,
although I totally rebooted my dotfiles several times since then
- [@chriskempson](https://github.com/chriskempson/base16) - for base16
- [@sorin-ionescu](https://github.com/sorin-ionescu/prezto) - for prezto
- [@skwp](https://github.com/skwp/dotfiles) - another inspiration dotfiles repo
- [@mathiasbyens](https://github.com/mathiasbynens/dotfiles) - for his awesome osx customization script
- [@erikzaadi](http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/) - for the auto-installation of vundle in vimrc

---
## License

Copyright 2014 Jeff Widman
Licensed under the MIT License
