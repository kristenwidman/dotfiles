#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

### Postgres
export PGDATA="/usr/local/var/postgres"

### VirtualEnv
# Note: maybe these should be in .zshenv rather than .zshrc
# virtualenv should use Distribute instead of legacy setuptools
export VIRTUALENV_DISTRIBUTE=true

# pip should only run if there is a virtualenv currently activated
# prevents accidentally installing packages without a virtualenv
export PIP_REQUIRE_VIRTUALENV=true
# create syspip workaround
syspip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
syspip3(){
   PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}

### VirtualEnvWrapper
# Note: maybe these should be in .zshenv rather than .zshrc
export PROJECT_HOME=$HOME/Code/git

# The variable $VIRTUALENVWRAPPER_VIRTUALENV_ARGS tells
# virtualenvwrapper what arguments to pass to virtualenv.
# For example, set the value to --no-site-packages to ensure # that all new environments are isolated from the system
# site-packages directory.
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'


### Use Base16 templating system to theme shell colors
# if [[ -s "$HOME/.config/base16-shell/base16-ocean.dark.sh" ]]; then
#   source "$HOME/.config/base16-shell/base16-ocean.dark.sh"
# fi


### Extra ZSH options
# If querying the user before executing `rm *' or `rm
# path/*', first wait ten seconds and ignore anything typed
# in that time. This avoids the problem of reflexively
# answering `yes' to the query when one didn't really mean
# it.
setopt RM_STAR_WAIT

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#k's add-ons
autoload -U colors && colors

title() { print -Pn "\e]0;${USER}@$(hostname | cut -d. -f1): $*\a"; }
precmd() { title "zsh"; }
preexec() { title $1; }

setopt NO_BEEP
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY SHARE_HISTORY
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS

HISTFILE=$HOME/.dotfiles/.zsh/.zhistory
HISTSIZE=1000
SAVEHIST=1000
WORDCHARS="${WORDCHARS:s#/#}"

alias ll='ls -la' # show hidden files
alias la='ls -la' # show hidden files, same as above
alias lr='ls -lR' # recursive ls

alias sr='screen -DRR' # screen resume

# command line movement by word/line with alt-arrow or cmd-arrow
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word
