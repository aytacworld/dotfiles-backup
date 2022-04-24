DEFAULT_USER=$(whoami)

export EDITOR=/usr/bin/vim

export TERM="xterm-256color"

export PATH=$PATH:$HOME/.local/bin:$DOTFILES/bin:$HOME/bin
export XDG_CONFIG_HOME=$HOME/.config

export ZSH="$HOME/.oh-my-zsh"
export BIN="$DOTFILES/bin"

export DOTNET_CLI_TELEMETRY_OPTOUT=1

source $DOTFILES/private/zsh/vars.sh
